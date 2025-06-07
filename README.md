# Notes on architectures

This repository contains some of my personal notes on subjects related to ARM, MIPS, x86, microcontrollers and other architectures, as well as on Termux, which is a terminal emulator and Linux environment application for Android that allows you to run Linux command line commands and tools directly on your cell phone or tablet. In the case of Termux, I use an SSH server and a JupyterLab server, and access is done remotely through the PC.


## Termux

<https://termux.dev/en/>


### SSH install

SSH setup right after installing Termux on Android:

```sh
pkg install openssh termux-auth -y
passwd
whoami
sshd
```

The SSH server is started with the `sshd` command and from this moment Termux can be accessed from the PC via SSH.

### SSH config on PC

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

### JupyterLab(JL) install (Termux)

```sh
pkg install -y libzmq openssl-tool build-essential cmake binutils rust
pip install --user pyzmq==25.1.2
pip install jupyterlab
```

### Interactive access to JL (Termux)

```sh
jupyter-lab --no-browser --ip=* --IdentityProvider.token='' --notebook-dir=~
```

And then the JL client can be accessed on the PC using the address `http://<hostname>:8888`.

### Mounting the file system (PC)

```sh
sshfs <hostname>:/data/data/com.termux/files/home /mnt/<hostname> -o uid=$(id -u),gid=$(id -g)
```


## Notes on some files

My personal notes on generating executables on selected architectures

* My personal notes on Clang AArch64.
    * [clang-aarch64-2025-06-06.ipynb](clang/clang-aarch64.ipynb) rev. 2025-06-06
    * [clang-aarch64-2023-01-28.ipynb](clang/clang-aarch64.ipynb) rev. 2023-01-28
* My personal notes on Flang AArch64.
    * [flang-aarch64-2023-01-28.ipynb](flang/flang-aarch64.ipynb) rev. 2023-01-28
    * [flang-aarch64-2025-06-06.ipynb](flang/flang-aarch64.ipynb) rev. 2025-06-06
* [install-flang-aarch64.ipynb](flang/install-flang-aarch64.ipynb) - Install Flang on aarch64.
* [gcc_amd64.ipynb](gcc/gcc_amd64.ipynb) - Understanding executables. Running on a laptop with an i7-9750H processor.
* [gcc_arm32.ipynb](gcc/gcc_arm32.ipynb) - Understanding executables. Running on an Orange Pi Zero, with 32-bit ARMv7-A Cortex-A7 architecture.


## ELF diagram

- [ELF Executable_and_Linkable_Format diagram](img/ELF_Executable_and_Linkable_Format_diagram_by_Ange_Albertini.png) [[Source](https://upload.wikimedia.org/wikipedia/commons/e/e4/ELF_Executable_and_Linkable_Format_diagram_by_Ange_Albertini.png)]


## Links of interest

* Intel manuals. <https://software.intel.com/en-us/articles/intel-sdm>
* x86 and amd64 instruction reference. <https://www.felixcloutier.com/x86/index.html>
* JORGENSEN, E. x86-64 Assembly Language Programming with Ubuntu. <http://www.egr.unlv.edu/~ed/assembly64.pdf>
* Boldyshev & Rideau. Linux Assembly HOWTO. 2000. <http://www.mit.edu/afs.new/athena/system/rhlinux/redhat-6.2-docs/HOWTOS/other-formats/pdf/Assembly-HOWTO.pdf>
* Ray Toal. x86 Assembly Language Programming. <https://cs.lmu.edu/~ray/notes/x86assembly/>


## Some references

* HOEY, J. V. [Beginning x64 Assembly Programming](http://www.google.com.br/books/edition/Beginning_x64_Assembly_Programming/mSa7DwAAQBAJ). 2019.
* MILLER, A. R. [Assembly Language Techniques for the IBM PC](https://www.google.com.br/books/edition/Assembly_Language_Techniques_for_the_IBM/0FsgAQAAIAAJ). 1986.



<br><sub>Last edited: 2025-06-06 21:49:05</sub>
