#!/bin/bash

# Configure TightVNC Server.
vncserver :1 && vncserver -kill :1
mkdir -p ~/.vnc
cat <<EOL > ~/.vnc/xstartup
#!/bin/bash
xsetroot -solid black &
EOL
chmod +x ~/.vnc/xstartup

# Set empty password.
echo -e "\n\n" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd
echo "no" > ~/.vnc/config
