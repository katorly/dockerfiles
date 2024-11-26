FROM katorly/workspace-base:latest

# Install Go
RUN GO_VERSION=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version') && \
    wget https://go.dev/dl/${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C $HOME -xzf ${GO_VERSION}.linux-amd64.tar.gz && \
    export PATH=$HOME/go/bin:$PATH && \
    echo "export PATH=$HOME/go/bin:$PATH" >> ~/.bashrc && \
    rm ${GO_VERSION}.linux-amd64.tar.gz && \
    # Install development tools
    go install -v github.com/go-delve/delve/cmd/dlv@latest && \
    go install -v github.com/golangci/golangci-lint/cmd/golangci-lint@latest && \
    go clean -cache -modcache

# Set Go project example path
ENV GOPATH /workspace