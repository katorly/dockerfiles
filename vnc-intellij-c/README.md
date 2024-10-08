# vnc-intellij-c
Basic Java development environment with IntelliJ IDEA Community in VNC.

## Includes
- IntelliJ IDEA Community
- TightVNC & noVNC
- Java 21
- Kotlin
- Maven & Gradle

Use SDKMAN to install and manage Java versions.

## Usage
Map the container's port 6081 to your host's port:
```shell
docker run -p <host-port>:6081 -it katorly/vnc-intellij-c:latest
```

Then visit `localhost:<host-port>` in your browser, and click "Connect". When asked for credentials, press "Send Credentials" with empty password.