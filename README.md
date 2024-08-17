# dockerfiles
[![License](https://img.shields.io/badge/license-MIT-brightgreen?style=flat-square)](LICENSE)

Dockerfiles of my workspace images.

## Use
```shell
docker run -it katorly/<image-name>
```

## Build
```shell
docker build --no-cache -t katorly/<image-name>:<current-date> <folder-path>
```

## Push (Publish)
```shell
docker tag katorly/<image-name>:<current-date> katorly/<image-name>:latest
docker push katorly/<image-name>:<current-date>
docker push katorly/<image-name>:latest
```
