FROM katorly/workspace-base:latest

# The Python version to install: https://devguide.python.org/versions/#supported-versions
ARG PYTHON_VERSION=3.12

# Run as root
USER root

# Install pyenv dependencies
RUN DEBIAN_FRONTEND="noninteractive" apt-get update -y && apt-get install -y --no-install-recommends \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    zlib1g-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set back to non-root user
USER dev

# Install pyenv
RUN curl https://pyenv.run | bash

# Set pyenv environment variables
ENV PYENV_ROOT /home/dev/.pyenv
ENV PATH $PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH

# Install Python
RUN pyenv install ${PYTHON_VERSION} && \
    pyenv global ${PYTHON_VERSION} && \
    # Install development tools
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --upgrade setuptools wheel virtualenv pipenv \
    pylint flake8 black rope pylama pytest twine \
    pandas ipython jupyterlab notebook && \
    curl -sSL https://install.python-poetry.org | python3

# Configure Jupyter Notebook
RUN jupyter notebook --generate-config && \
    echo "c.ServerApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.allow_root = True" >> ~/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.open_browser = False" >> ~/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.port = 8888" >> ~/.jupyter/jupyter_server_config.py
EXPOSE 8888