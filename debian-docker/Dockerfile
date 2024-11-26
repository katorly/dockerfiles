FROM debian:12

ENV DEBIAN_FRONTEND=noninteractive

# Install Docker
RUN apt-get update -y && \
    apt-get install -y sudo curl wget jq && \
    curl -fsSL https://get.docker.com | bash && \
    echo '{"log-driver": "json-file", "log-opts": {"max-size": "500m", "max-file": "3"}}' | tee /etc/docker/daemon.json > /dev/null && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Start Docker daemon on startup
ENTRYPOINT ["/bin/bash", "-c", "sudo /etc/init.d/docker start && /bin/bash"]