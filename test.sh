#!/bin/bash
set -e

usage() {
    echo "This script uses Podman to run tests in a standardized environment."
    echo "This is most useful on macOS, where golden tests (ran natively) will "
    echo "often fail due to differences in text rendering."
    echo
    echo "You can use this script by replacing any \`flutter test\` command with"
    echo "this script, and passing the same arguments to it."
    echo "e.g. instead of running:"
    echo "     flutter test --update-goldens"
    echo "you can run:"
    echo "     $0 --update-goldens"
    echo
    echo "There are also some additional arguments you can pass to this script:"
    echo "     --help: Show this help message"
    echo "     --clean: Delete the image and container"
    echo "     --update: Update the container's Flutter and pub cache from the host."
}
if [[ "$1" == "--help" ]]; then
    usage
    exit 0
fi

# Check if podman is installed
if ! command -v podman &> /dev/null; then
    echo "Podman is not installed. Please install Podman to use this script."
    echo "https://podman.io/docs/installation"
    exit 1
fi
# Check that podman works (on macOS/Windows this needs a running podman machine)
if ! podman info >/dev/null 2>&1; then
    echo "Podman does not seem to be working."
    echo "On macOS/Windows, run \`podman machine init\` (once) and \`podman machine start\`, then retry."
    exit 1
fi
# Check that we're in the project root
if [[ ! -f "privacy_policy.md" ]]; then
    echo "Error: Please run this script from the project root."
    exit 1
fi
if [ ! -d "$FLUTTER_ROOT" ]; then
  echo "Error: Env FLUTTER_ROOT not set."
  exit 1
fi
if [ ! -d "${PUB_CACHE:=$HOME/.pub-cache}" ]; then
  echo "Error: Env PUB_CACHE not set."
  exit 1
fi

buildName=$(grep -oP "(?<=buildName = ').*(?=')" lib/data/version.dart)
IMAGE_NAME="ghcr.io/saber-notes/saber_test_env:$buildName"
CONTAINER_NAME="saber_test_container"

# Remove image and container by running `./test.sh --clean`
if [[ "$1" == "--clean" ]]; then
    echo 'Stopping container'
    podman stop "$CONTAINER_NAME" || true
    echo 'Removing container'
    podman rm -f "$CONTAINER_NAME" || true
    echo 'Removing image'
    podman rmi -f "$IMAGE_NAME" || true
    echo 'Removing cached files'
    rm -rf .github/docker/mounts
    echo 'Done'
    exit 0
fi

# Update flutter and pub cache by running `./test.sh --update`
copy_flutter_from_host() {
    mkdir -p .github/docker/mounts
    mkdir -p .dart_tool
    mkdir -p build
    [ -d .github/docker/mounts/flutter ] || cp -a "$FLUTTER_ROOT" .github/docker/mounts/
    [ -d .github/docker/mounts/.pub-cache ] || cp -a "$PUB_CACHE" .github/docker/mounts/
    [ -d .github/docker/mounts/.dart_tool ] || cp -a .dart_tool .github/docker/mounts/
    [ -d .github/docker/mounts/build ] || cp -a build .github/docker/mounts/
    [ -f .github/docker/mounts/pubspec.lock ] || cp -a pubspec.lock .github/docker/mounts/
}
if [[ "$1" == "--update" ]]; then
    mkdir -p .github/docker/mounts
    mkdir -p .dart_tool
    mkdir -p build
    cp -a "$FLUTTER_ROOT" .github/docker/mounts/
    cp -a "$PUB_CACHE" .github/docker/mounts/
    cp -a .dart_tool .github/docker/mounts/
    cp -a build .github/docker/mounts/
    cp -a pubspec.lock .github/docker/mounts/
    exit 0
fi

# Get current directory
if [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
    APP_PATH="$(pwd -W)" # Windows-style path on Windows
else
    APP_PATH="$(pwd)"
fi
echo "Using application path: $APP_PATH"

# Pull image if we don't have it yet
if ! podman image exists "$IMAGE_NAME"; then
    echo "Pulling image '$IMAGE_NAME'. This only needs to be done once."
    podman pull "$IMAGE_NAME"
fi

# Make sure mounts exist
mkdir -p .github/docker/mounts
copy_flutter_from_host
mkdir -p .github/docker/mounts/linux-flutter-ephemeral
mkdir -p .github/docker/mounts/macos-flutter-ephemeral
mkdir -p .github/docker/mounts/windows-flutter-ephemeral
touch .github/docker/mounts/.flutter-plugins-dependencies

# Delete container if it used an outdated image.
if podman container exists "$CONTAINER_NAME"; then
    CONTAINER_IMAGE_ID=$(podman container inspect --format '{{.ImageName}}' "$CONTAINER_NAME")
    if [[ "$CONTAINER_IMAGE_ID" != "$IMAGE_ID" ]]; then
        echo "Removing stale container to be recreated."
        podman rm -f "$CONTAINER_NAME"
    fi
fi

# Start or create container from image
if podman container exists "$CONTAINER_NAME"; then
    echo "Starting existing container $CONTAINER_NAME"
    podman start "$CONTAINER_NAME"
else
    echo "Creating new container $CONTAINER_NAME. This will only be done once."

    podman run -dit --name "$CONTAINER_NAME" \
        --security-opt label=disable \
        -w "$APP_PATH" \
        -v "$APP_PATH":"$APP_PATH" \
        -v "$APP_PATH/.github/docker/mounts/flutter":"/root/flutter" \
        -v "$APP_PATH/.github/docker/mounts/.pub-cache":"/root/.pub-cache" \
        -v "$APP_PATH/.github/docker/mounts/.dart_tool":"$APP_PATH/.dart_tool" \
        -v "$APP_PATH/.github/docker/mounts/build":"$APP_PATH/build" \
        -v "$APP_PATH/.github/docker/mounts/.flutter-plugins-dependencies":"$APP_PATH/.flutter-plugins-dependencies" \
        -v "$APP_PATH/.github/docker/mounts/pubspec.lock":"$APP_PATH/pubspec.lock" \
        -v "$APP_PATH/.github/docker/mounts/linux-flutter-ephemeral":"$APP_PATH/linux/flutter/ephemeral" \
        -v "$APP_PATH/.github/docker/mounts/macos-flutter-ephemeral":"$APP_PATH/macos/Flutter/ephemeral" \
        -v "$APP_PATH/.github/docker/mounts/windows-flutter-ephemeral":"$APP_PATH/windows/flutter/ephemeral" \
        "$IMAGE_NAME"
    podman exec -it "$CONTAINER_NAME" flutter pub get
    podman exec -it "$CONTAINER_NAME" dart run golden_screenshot:download_apple_fonts
    echo Finished setting up container. Running tests...
    echo
fi

podman exec -it "$CONTAINER_NAME" flutter test "$@"
exit $?
