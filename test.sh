#!/bin/bash
set -e

usage() {
    echo "This script uses Docker to run tests in a standardized environment."
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
    echo "     --clean: Delete the docker image and container"
}
if [[ "$1" == "--help" ]]; then
    usage
    exit 0
fi

DOCKERFILE_PATH=".github/docker/Dockerfile"
IMAGE_NAME="saber_test_env"
CONTAINER_NAME="saber_test_container"

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker to use this script."
    echo "https://docs.docker.com/get-docker/"
    exit 1
fi
# Check if docker engine is running
if ! docker version >/dev/null 2>&1; then
    echo "Docker Engine does not seem to be running: run it first and retry!"
    exit 1
fi

# Remove docker image and container by running `./test.sh --clean`
if [[ "$1" == "--clean" ]]; then
    echo 'Stopping docker container'
    docker stop "$CONTAINER_NAME"
    echo 'Removing docker container'
    docker rm -f "$CONTAINER_NAME"
    echo 'Removing docker image'
    docker rmi -f "$IMAGE_NAME"
    echo 'Done'
    exit 0
fi

# Build image if it doesn't exist
if ! docker images --format '{{.Repository}}' | grep -w "$IMAGE_NAME" > /dev/null; then
    echo "Building Docker image '$IMAGE_NAME' from $DOCKERFILE_PATH. This will take a few minutes but only needs to be done once."
    docker build -t "$IMAGE_NAME" -f "$DOCKERFILE_PATH" "$(dirname $DOCKERFILE_PATH)"
fi

# Make sure mounts exist
mkdir -p .github/docker/.pub-cache
mkdir -p .github/docker/.dart_tool
mkdir -p .github/docker/build
touch .github/docker/.flutter-plugins
touch .github/docker/.flutter-plugins-dependencies
touch .github/docker/pubspec.lock

# Start or create container from image
if docker ps -a --format '{{.Names}}' | grep -w "$CONTAINER_NAME" > /dev/null; then
    echo "Starting existing container $CONTAINER_NAME"
    docker start "$CONTAINER_NAME"
else
    echo "Creating new container $CONTAINER_NAME. This will only be done once."

    # Get current directory
    if [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
        APP_PATH="$(pwd -W)" # Windows-style path on Windows
    else
        APP_PATH="$(pwd)"
    fi

    # Run container
    docker run -dit --name "$CONTAINER_NAME" \
        -v "$APP_PATH":/app \
        -v "$APP_PATH/.github/docker/.pub-cache":/root/.pub-cache \
        -v "$APP_PATH/.github/docker/.dart_tool":/app/.dart_tool \
        -v "$APP_PATH/.github/docker/build":/app/build \
        -v "$APP_PATH/.github/docker/.flutter-plugins":/app/.flutter-plugins \
        -v "$APP_PATH/.github/docker/.flutter-plugins-dependencies":/app/.flutter-plugins-dependencies \
        -v "$APP_PATH/.github/docker/pubspec.lock":/app/pubspec.lock \
        "$IMAGE_NAME"
    docker exec -it "$CONTAINER_NAME" flutter pub get
fi

docker exec -it "$CONTAINER_NAME" flutter test "$@"
exit $?
