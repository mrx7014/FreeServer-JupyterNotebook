# FreeServer-JupyterNotebook

## Overview

Welcome to **FreeServer-JupyterNotebook**! This is a powerful, preconfigured Linux server environment optimized for **Jupyter Notebooks** with support for the **Almond** (Scala kernel) and **Binder**. It’s designed for data science, machine learning, and **Android development**, providing a robust development setup right out of the box.

### Key Features:
- **High-Performance Linux Server** with **Jupyter Notebook** support.
- Preinstalled **development tools** and libraries for Android development and more.
- **Almond Scala Kernel** for Jupyter.
- Launch in **Binder** for quick access or locally with full **root access**.

---

## Server Specifications

| **Specification**         | **Details**                                |
|---------------------------|--------------------------------------------|
| **RAM**                   | 745 GB                                     |
| **CPU**                   | Intel Xeon Gold 6140 (72 Cores) @ 2.3 GHz |
| **Kernel**                | 5.15.0-107-generic                        |
| **Shell**                 | bash 5.0.17                               |
| **Storage**               | 6 TB                                       |

---

## Preinstalled Packages

This environment comes pre-configured with a variety of essential tools for both **data science** and **Android development**. Here are the key packages installed:

### Development & Build Tools:
- `openjdk-8-jre-headless`
- `build-essential`
- `ninja-build`
- `clang`, `llvm`, `lld`, `lldb`
- `make`, `cmake`, `automake`, `autoconf`
- `perl`, `gawk`, `bison`, `flex`
- `bc`
- `git`, `git-lfs`
- `wget`, `curl`, `rsync`, `jq`
- `dialog`, `expect`
- `zsh`, `bash`, `sed`
- `tar`, `zip`, `cpio`, `dos2unix`
- `neofetch`, `squashfs-tools`, `xz`
- `libssl-dev`, `lib32readline-dev`, `lib32z1-dev`
- `libsdl1.2-dev`, `libwxgtk3.0-gtk3-dev`
- `libxml2`, `libxml2-utils`, `libncurses5-dev`
- `liblz4-tool`, `liblz4-dev`

---

## How to Use

### 1. Launch on Binder

You can quickly access this environment on **Binder** using the button below. Binder will spin up a containerized instance of this environment, allowing you to start coding right away!

[![Launch on Binder](https://mybinder.org/v2/gh/mrx7014/FreeServer-JupyterNotebook/master?urlpath=lab%2Ftree%2Fnotebooks%2Findex.ipynb)

> [!NOTE] 
> Please wait about **5 minutes** after launching, as the environment may take some time to be ready. You will be redirected to the **Jupyter Notebook Lab** interface once it’s ready.


---

### 2. Avoid Session Timeout

Once you're in Jupyter Notebook Lab, the environment may automatically close the session if there's no activity for a period of time. To avoid this and keep your session active indefinitely, run the following command in the terminal:

```sh
jupyter notebook --NotebookApp.shutdown_no_activity_timeout=0
```
---

### 3. Get Root Access

If you need to perform administrative tasks, install software, or modify system settings, you can get root access by running a script. Here’s how:
```sh
git clone https://github.com/foxytouxxx/freeroot.git;cd freeroot;chmod +x root.sh;bash root.sh
```
When prompted, type YES to grant the script root access. This will allow you to perform tasks that require elevated permissions.

---

### 4. (Optional) Bypass systemctl

In environments like Binder or Docker, the `systemctl` command may not be available. If you need to run commands that require `systemctl` (such as managing system services), you can bypass it by downloading a script that mimics `systemctl` functionality.

To bypass `systemctl`, run this command in the terminal:

```sh
curl -o /bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py && chmod -R 777 /bin/systemctl
```
This script will allow you to use systemctl commands even in environments where it’s normally unavailable.

---

### Troubleshooting

- Binder Performance: Since Binder is a shared cloud environment, it may experience slowdowns or latency, especially if the server is under heavy load. Please be patient while launching or running tasks.

- Root Access: Root access is granted via the freeroot script, which lets you install software and configure the environment. Always review any scripts before running them to ensure they do not make unintended changes to the system.

---

### Notes

- Jupyter Notebook is a popular web application that allows you to create and share documents with live code, visualizations, and text. It’s widely used in fields like data science and machine learning.

- Almond is a Scala kernel for Jupyter, designed for Scala developers who wish to use Jupyter as their interactive development environment.

---

### Contributing

We welcome contributions to **FreeServer-JupyterNotebook!** If you find any bugs, suggest improvements, or want to add features, feel free to submit a pull request.

Steps to Contribute:

- 1: Fork this repository.
- 2: Create a new branch for your feature.
- 3: Make your changes.
- 4: Submit a pull request with a clear description of the changes.

---

### License

- This project is licensed under the **MIT License**. See the LICENSE file for details.

---

### Acknowledgements

- **Jupyter Notebook** and **Binder** for providing an easy-to-use environment for development. 
- The open-source community for contributing valuable tools and resources that make this project possible.

---

### Contact

- For further questions, discussions, or collaborations, please reach out through GitHub Issues: GitHub Issues

**or**

- Text me on ![Telegram](https://t.me/mrx7014)

---

### Support

- Join my Telegram Channel ![MRX7014 Cloud](https://t.me/mrx7014cloud)

**Thank you for using FreeServer-JupyterNotebook <3**
