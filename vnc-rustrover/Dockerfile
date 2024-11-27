FROM katorly/workspace-rust:latest

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
RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC && \
    git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify && \
    # Enable users to enter noVNC upon visiting port
    ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html

# Install the latest JetBrains RustRover
RUN mkdir -p /opt/rustrover && \
    curl -LSs "https://download.jetbrains.com/product?code=RR&platform=linux" | sudo tar -C /opt/rustrover --strip-components 1 -xzvf -

COPY process_monitor.sh /process_monitor.sh
RUN chmod +x /process_monitor.sh

# Set back to non-root user
USER dev
ENV USER="dev"

# Configure TightVNC
COPY setup_vnc.sh /setup_vnc.sh
RUN sudo chmod +x /setup_vnc.sh && /setup_vnc.sh

EXPOSE 6081

# Start JetBrains RustRover
CMD ["sh", "-c", "dbus-launch --exit-with-session /process_monitor.sh"]