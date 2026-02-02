FROM katorly/workspace-node:latest

# Run as root
USER root

# Install TightVNC
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && apt-get install -y --no-install-recommends \
    tightvncserver \
    dbus-x11 \
    xfce4 \
    xfce4-goodies \
    xfonts-base \
    x11-xserver-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install noVNC & websockify
RUN git clone --depth 1 https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone --depth 1 https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
    # Enable users to enter noVNC upon visiting port
    ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html

# Install the latest JetBrains WebStorm
RUN mkdir -p /opt/webstorm && \
    curl -LSs "https://download.jetbrains.com/product?code=WS&platform=linux" | sudo tar -C /opt/webstorm --strip-components 1 -xzvf -

COPY process_monitor.sh /process_monitor.sh
RUN chmod +x /process_monitor.sh

# Set back to non-root user
USER dev
ENV USER="dev"

# Configure TightVNC
COPY setup_vnc.sh /setup_vnc.sh
RUN sudo chmod +x /setup_vnc.sh && /setup_vnc.sh

EXPOSE 6081

# Start JetBrains WebStorm
CMD ["sh", "-c", "dbus-launch --exit-with-session /process_monitor.sh"]