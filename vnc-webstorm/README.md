# vnc-webstorm
Basic Web development environment with JetBrains WebStorm in VNC.

Please note that according to JetBrains, WebStorm is only free for non-commercial use.

## Includes
- JetBrains WebStorm
- TightVNC & noVNC
- Node.js
- npm, yarn, pnpm

## Usage
Map the container's port 6081 to your host's port:
```shell
docker run -p <host-port>:6081 -it katorly/vnc-webstorm:latest
```

Then visit `localhost:<host-port>` in your browser, and click "Connect". When asked for credentials, press "Send Credentials" with empty password.