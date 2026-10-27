FROM docker.io/library/rust:latest

# Set non-interactive mode for installations
ENV DEBIAN_FRONTEND=noninteractive

# Install apt dependencies
RUN apt-get update && \
    apt-get -qq install -y --no-install-recommends \
        curl git unzip xz-utils zip libglu1-mesa clang cmake ninja-build mesa-utils libgtk-3-dev \
        libsecret-1-dev libjsoncpp-dev ghostscript webkit2gtk-4.1-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Suppress Flutter root warnings.
RUN touch /.dockerenv

# Install Flutter
ENV FLUTTER_ROOT=/root/flutter
ENV PUB_CACHE=/root/.pub-cache
ENV PATH="/root/flutter/bin:/root/.pub-cache/bin:$PATH"

# Default command: open a shell
CMD ["/bin/bash"]
