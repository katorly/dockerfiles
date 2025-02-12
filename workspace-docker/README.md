# workspace-docker
Docker-related development environment with optimization tools.

## Includes
- Docker & Docker Compose
- [dive](https://github.com/wagoodman/dive)
- [Slim](https://github.com/slimtoolkit/slim)

Use `--privileged` flag to enable Docker inside your container. For example:
```shell
docker run --privileged -it katorly/workspace-docker:latest
```

> [!CAUTION]  
> Using `--privileged` flag may pose significant risks to the host machine. Use it at your own risk.
