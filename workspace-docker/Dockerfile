FROM katorly/workspace-base:latest

# Run as root
USER root

RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "Types: deb" > /etc/apt/sources.list.d/docker.sources && \
    echo "URIs: https://download.docker.com/linux/ubuntu" >> /etc/apt/sources.list.d/docker.sources && \
    echo "Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")" >> /etc/apt/sources.list.d/docker.sources && \
    echo "Components: stable" >> /etc/apt/sources.list.d/docker.sources && \
    echo "Signed-By: /etc/apt/keyrings/docker.asc" >> /etc/apt/sources.list.d/docker.sources && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    # Allow non-root user to use docker
    usermod -aG docker dev && \
    # Set buildx as the default builder for docker build
    mkdir -p /root/.docker && \ 
    echo '{"aliases":{"builder":"buildx"}}' > /root/.docker/config.json && \
    mkdir -p /home/dev/.docker && \
    echo '{"aliases":{"builder":"buildx"}}' > /home/dev/.docker/config.json && \
    chown -R dev:dev /home/dev/.docker && \
    # Install dive (https://github.com/wagoodman/dive)
    DIVE_VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/') && \
    curl -OL https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb && \
    apt install ./dive_${DIVE_VERSION}_linux_amd64.deb && \
    rm dive_${DIVE_VERSION}_linux_amd64.deb && \
    # Install Slim (https://github.com/slimtoolkit/slim)
    curl -sL https://raw.githubusercontent.com/slimtoolkit/slim/master/scripts/install-slim.sh | bash - && \
    # Install dind-wrapper for better DinD support
    curl -fsSL https://raw.githubusercontent.com/moby/moby/master/hack/dind -o /usr/local/bin/dind && \
    chmod +x /usr/local/bin/dind && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Start Docker daemon on startup
COPY entrypoint.sh /usr/local/bin/
COPY entrypoint.sh /workspace/
RUN chmod +x /usr/local/bin/entrypoint.sh /workspace/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]