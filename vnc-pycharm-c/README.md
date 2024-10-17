# vnc-pycharm-c
Basic Python development environment with PyCharm Community in VNC.

## Includes
- PyCharm Community
- TightVNC & noVNC
- Python 3.12
- Tools for dependencies management, code analysis, package publishing, etc.
- Jupyter

Use pyenv to install and manage Python versions.

## Usage
Map the container's port 6081 to your host's port:
```shell
docker run -p <host-port>:6081 -it katorly/vnc-pycharm-c:latest
```

Then visit `localhost:<host-port>` in your browser, and click "Connect". When asked for credentials, press "Send Credentials" with empty password.