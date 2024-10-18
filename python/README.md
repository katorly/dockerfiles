# workspace-python
Basic Python development environment.

## Includes
- Python 3.12
- Tools for dependencies management, code analysis, package publishing, etc.
- Jupyter

Use pyenv to install and manage Python versions.

Map the container's port 8888 to your host's port to use Jupyter Notebook:
```shell
docker run -p <host-port>:8888 -it katorly/workspace-python:latest
```