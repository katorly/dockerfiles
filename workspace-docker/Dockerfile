FROM katorly/workspace-base:latest

# Run as root
USER root

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release && \
    # Install Docker
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update -y && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    # Allow non-root user to use docker
    usermod -aG docker dev && \
    # Install dive (https://github.com/wagoodman/dive)
    DIVE_VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/') && \
    curl -OL https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb && \
    apt install ./dive_${DIVE_VERSION}_linux_amd64.deb && \
    rm dive_${DIVE_VERSION}_linux_amd64.deb && \
    # Install Slim (https://github.com/slimtoolkit/slim)
    curl -sL https://raw.githubusercontent.com/slimtoolkit/slim/master/scripts/install-slim.sh | bash - && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set back to non-root user
USER dev

# Start Docker daemon on startup
ENTRYPOINT ["/bin/bash", "-c", "sudo /etc/init.d/docker start && /bin/bash"]