FROM katorly/workspace-base:latest

# Run as root
USER root

# Install C & C++
RUN add-apt-repository ppa:ubuntu-toolchain-r/test && \
    DEBIAN_FRONTEND="noninteractive" apt-get update -y && apt-get install -y --no-install-recommends \
    clang \
    clangd \
    clang-format \
    clang-tidy \
    clang-tools \
    cmake \
    gcc \
    gdb \
    valgrind && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set back to non-root user
USER dev