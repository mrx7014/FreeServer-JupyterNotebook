FROM almondsh/almond:0.15.0

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

# This grants sudo in runtimes that allow privilege escalation. Public Binder
# may still block sudo at runtime with no-new-privileges.
RUN printf '%s\n' \
      'jovyan ALL=(ALL) NOPASSWD:ALL' \
      'Defaults:jovyan !requiretty' \
    > /etc/sudoers.d/jovyan && \
    chmod 0440 /etc/sudoers.d/jovyan

USER ${NB_UID}
COPY --chown=1000:100 notebooks/ /home/jovyan/
WORKDIR /home/jovyan
