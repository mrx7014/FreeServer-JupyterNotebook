# FreeServer-JupyterNotebook

A ready-to-use Jupyter environment with the **Almond Scala kernel**, common development tools, Git, Graphviz, and the notebooks included in this repository. The image is based on `almondsh/almond:latest`, so Almond's Scala kernels are already installed.

## Features

- JupyterLab and Jupyter Notebook.
- Almond Scala kernels.
- Java required by Almond.
- Development tools including `git`, `git-lfs`, `build-essential`, `cmake`, `curl`, `wget`, `unzip`, `jq`, `tmux`, and `rsync`.
- Graphviz.
- `sudo` configured for the `jovyan` user without a password.
- The contents of `notebooks/` are available under `/home/jovyan/`.

## Launch on Binder

Open the environment directly with:

[![Launch on Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mrx7014/FreeServer-JupyterNotebook/master?urlpath=lab)

Or use this URL:

```text
https://mybinder.org/v2/gh/mrx7014/FreeServer-JupyterNotebook/master?urlpath=lab
```

The first build may take several minutes because Binder builds the image from the `Dockerfile`.

### Important Binder and sudo limitation

The `Dockerfile` installs `sudo` and configures the `jovyan` user during the image build. However, Binder may run the container with the `no-new-privileges` security setting. If you see:

```text
sudo: The "no new privileges" flag is set
```

this is a restriction imposed by the Binder platform, not a missing package or repository setting. A Dockerfile cannot remove that restriction from inside the running container.

To use `sudo apt update` at runtime, run the image locally or on a server whose container runtime you control.

## Run locally with Docker

Clone the repository and build the image:

```bash
git clone https://github.com/mrx7014/FreeServer-JupyterNotebook.git
cd FreeServer-JupyterNotebook
docker build -t free-almond-jupyter .
```

Run Jupyter:

```bash
docker run --rm -it \
  --name free-almond-jupyter \
  -p 8888:8888 \
  --security-opt=no-new-privileges:false \
  free-almond-jupyter
```

Open the URL printed in the terminal. From a Jupyter Terminal, test the setup:

```bash
whoami
sudo -n id
sudo apt update
```

The default user is `jovyan`. Packages installed in the image do not require `sudo`; installing additional system packages at runtime does, provided the container runtime allows privilege escalation.

## Run Jupyter as root locally

If you need Jupyter itself to run as root, use:

```bash
docker run --rm -it \
  --name free-almond-jupyter \
  --user root \
  --security-opt=no-new-privileges:false \
  -p 8888:8888 \
  free-almond-jupyter \
  start-notebook.py --allow-root
```

Running Jupyter as `jovyan` and using `sudo` only when needed is the safer default.

## Build files

- `Dockerfile`: builds the Almond/Jupyter image and installs system tools and `sudo`.
- `binder/apt.txt`: legacy Binder package list; the main `Dockerfile` is the source of truth when it is used.
- `binder/postBuild`: legacy manual Almond installation script. The current base image already includes Almond.
- `binder/requirements.txt`: additional Python requirements used by the project.
- `notebooks/`: example notebooks copied into the image.

## Prevent the notebook server from shutting down for inactivity

In environments that support this option, run:

```bash
jupyter notebook --NotebookApp.shutdown_no_activity_timeout=0
```

Binder still applies its own resource and lifetime limits, so a repository cannot guarantee a permanent Binder session.

## Security note

Do not run untrusted scripts from external repositories to obtain root access. Installing packages while building the image is the predictable and safer approach. Runtime privileges are controlled by Docker, Binder, Kubernetes, or the server running the image.

## License

This project is licensed under the [MIT License](LICENSE).
