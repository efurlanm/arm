# Notes about the ARM architecture

This repository contains my personal notes on subjects related to the ARM architecture, microcontrollers, and also Termux.

Termux is a terminal emulator and Linux environment application for Android that allows you to run Linux command line commands and tools directly on your cell phone or tablet. In Termux I run an SSH server and a JupyterLab server, and access is done remotely on the PC. Some Notebooks in this repository run on PC and others run on Termux.

- Termux: <https://termux.dev/en/>

## SSH install (Termux)

SSH setup right after installing Termux on Android:

```sh
pkg install openssh termux-auth -y
passwd
whoami
sshd
```

The SSH server is started with the `sshd` command and from this moment Termux can be accessed from the PC via SSH.

## SSH config on PC

On the PC, SSH should be configured (~/.ssh/config) with something like:

```
Host <hostname>
    HostName <hostname>
    Port 8022
    User <username>
    PubkeyAcceptedKeyTypes=+ssh-rsa
    ControlMaster Auto
    ControlPath ~/.ssh/remote_<hostname>
```

For PC passwordless access we use the command:

```sh
ssh-copy-id -f <username>@<hostname>
```

And then for interactive access to Termux on PC via SSH:

```sh
ssh <hostname>
```

Other settings include a fixed IP on Android for easier access, and inclusion in `/etc/hosts`, and the commands:

```sh
termux-setup-storage
termux-change-repo
```

## JupyterLab(JL) install (Termux)

```sh
pkg install -y libzmq openssl-tool build-essential cmake binutils rust
pip install --user pyzmq==25.1.2
pip install jupyterlab
```

## Interactive access to JL (Termux)

```sh
jupyter-lab --no-browser --ip=* --IdentityProvider.token='' --notebook-dir=~
```

And then the JL client can be accessed on the PC using the address `http://<hostname>:8888`.

## Mounting the file system (PC)

```sh
sshfs <hostname>:/data/data/com.termux/files/home /mnt/<hostname> -o uid=$(id -u),gid=$(id -g)
```
