# vnc-rustrover
Basic Rust development environment with JetBrains RustRover in VNC.

Please note that according to JetBrains, RustRover is only free for non-commercial use.

## Includes
- JetBrains RustRover
- TightVNC & noVNC
- Rust
- Tools for building, code analysis, etc.

## Usage
Map the container's port 6081 to your host's port:
```shell
docker run -p <host-port>:6081 -it katorly/vnc-rustrover:latest
```

Then visit `localhost:<host-port>` in your browser, and click "Connect". When asked for credentials, press "Send Credentials" with empty password.