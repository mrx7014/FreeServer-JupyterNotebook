FROM almondsh/almond:latest

# Install system packages while the image is being built.
# The runtime remains the normal Jupyter user (jovyan).
USER root

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=UTC

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      sudo \
      git \
      git-lfs \
      wget \
      curl \
      unzip \
      zip \
      jq \
      tmux \
      rsync \
      build-essential \
      cmake \
      graphviz \
      openssh-client \
      ca-certificates && \
    git lfs install --system && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Permit the normal Jupyter user to use sudo without a password.
# Whether sudo can actually elevate is also controlled by the container
# runtime; Docker must be started with --security-opt=no-new-privileges:false.
RUN printf '%s\n' \
      'jovyan ALL=(ALL) NOPASSWD:ALL' \
      'Defaults:jovyan !requiretty' \
    > /etc/sudoers.d/jovyan && \
    chmod 0440 /etc/sudoers.d/jovyan

USER $NB_UID

# Keep the notebooks bundled with this repository available in Jupyter.
COPY --chown=1000:100 notebooks/ /home/jovyan/

WORKDIR /home/jovyan
