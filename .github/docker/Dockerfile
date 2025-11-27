FROM debian:stable-slim

# Set non-interactive mode for installations
ENV DEBIAN_FRONTEND=noninteractive

# Install apt dependencies
RUN apt-get update && \
    apt-get -qq install -y \
        curl git unzip xz-utils zip libglu1-mesa clang cmake ninja-build mesa-utils libgtk-3-dev \
        libsecret-1-dev libjsoncpp-dev ghostscript webkit2gtk-4.1-dev && \
    apt-get clean

# Create `nonroot` user
RUN useradd -u 1000 -m nonroot
USER nonroot

# Install Flutter
RUN mkdir -p /home/nonroot/.pub-cache/bin/
ENV FLUTTER_ROOT=/home/nonroot/flutter
ENV PUB_CACHE=/home/nonroot/.pub-cache
ENV PATH="/home/nonroot/flutter/bin:/home/nonroot/.pub-cache/bin:$PATH"
# This ADD command invalidates the Docker cache when a new Flutter release is available
ADD https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json /tmp/releases_linux.json
RUN git clone https://github.com/flutter/flutter.git /home/nonroot/flutter --branch stable
RUN flutter precache --universal
RUN flutter doctor

ARG APP_PATH
WORKDIR ${APP_PATH}

# Default command: open a shell
CMD ["/bin/bash"]
