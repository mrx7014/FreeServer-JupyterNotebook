# FreeServer-JupyterNotebook

### A free Linux server with high End specifications running throw Jupyter Notebooks Lab, Almond (A Scala kernel for Jupyter) and Binder

### Server specifications

- RAM : `745GB`
- Kernel: `5.15.0-107-generic`
- Shell: `bash 5.0.17`
- CPU : `Intel Xeon Gold 6140 (72 Cores) @ 2.300GHz`
- Hard Size : `6TB`

# How to Use

### First:

- Lunch on Binder:
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mrx7014/FreeServer-JupyterNotebook/master?urlpath=lab%2Ftree%2Fnotebooks%2Findex.ipynb)

>[!NOTE]
> Wait almost 5 min after launching is done and you will redirect to Jupyter Notebook Lab
>

### After jupyter notebooks lab opened choose terminal and enter the Long Life-Time command to avoid close session

- Long Life-Time (enter on terminal)
```sh
jupyter notebook --NotebookApp.shutdown_no_activity_timeout=0
```

### After this click on `New` in the top bar and choose `launcher` --> `Terminal` and enter Root access script then type `YES` to install it

- Get root access
```sh
git clone https://github.com/foxytouxxx/freeroot.git;cd freeroot;chmod +x root.sh;bash root.sh
```

### (Optinal) If you will use any thing required systemctl use this command to Bypass systemctl

- Bypass systemctl
```sh
curl -o /bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py && chmod -R 777 /bin/systemctl
```
