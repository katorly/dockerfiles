# Use the official Ubuntu 24.04 base image
FROM ubuntu:24.04

# Remove default ubuntu user added from Ubuntu 23.04
RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu

# Set terminal environment variables
SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

# Run as root
USER root

# Install baseline packages
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    bash-completion \
    build-essential \
    curl \
    fish \
    htop \
    jq \
    locales \
    man-db \
    nano \
    net-tools \
    software-properties-common \
    sudo \
    time \
    unzip \
    vim \
    wget \
    zip \
    zsh && \
    # Install Git and Git LFS
    add-apt-repository -y ppa:git-core/ppa && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && \
    apt-get install -y --no-install-recommends git git-lfs && \
    # Clean up installation cache
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set terminal encoding to UTF-8
ENV LANG=en_US.UTF-8

# Add a non-root user `dev`
RUN useradd -u 10000 -mld /home/dev -s /bin/bash dev && \
    # Set no-password sudo
    echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    # Set workspace directory permissions
    mkdir -p /workspace && chown -hR dev:dev /workspace && \ 
    # Customize bash prompt
    echo -e "PS1='\[\033[01;33m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$(__git_ps1 \" (%s)\") $ '" >> /home/dev/.bashrc

# Set to `dev` user
USER dev

# Set default workspace directory
WORKDIR /workspace