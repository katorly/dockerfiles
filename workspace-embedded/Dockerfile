FROM katorly/workspace-c:latest

# Run as root
USER root

# Install embedded development tools
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && apt-get install -y --no-install-recommends \
    binutils-arm-none-eabi \
    gcc-arm-none-eabi \
    gdb-multiarch \
    libnewlib-arm-none-eabi \
    libssl-dev \
    libusb-dev \
    libncurses-dev \
    ninja-build \
    openocd \
    pkg-config \
    qemu-system && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set back to non-root user
USER dev