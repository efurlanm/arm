# My notes on small systems and related topics

This repository serves as a collection of personal random notes and experiments focused on restricted environments, operating systems, architectures such as ARM, MIPS, and x86, Assembly, C, and related topics. Some of the focus is on Termux (a terminal emulator and Linux environment for Android) on AArch64 devices, and the use of proot-distro, which uses proot to install nearly complete Linux distributions, creating isolated, container-like environments where Linux operates with remarkable independence from the underlying operating system.

<table>
  <tr>
    <td><img src="img/construction.gif"></td>
    <td>This repo is permanently under construction, so its content changes constantly.</td>
  </tr>
</table>

## Termux

Within Termux I use an SSH server and a JupyterLab server, and access is done remotely from the PC.

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

JupyterLab running in the Termux environment (outside the proot-distro).

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

### proot-distro

<https://github.com/termux/proot-distro>

    pkg install proot-distro
    proot-distro install ubuntu
    proot-distro login ubuntu

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

## Links about Executable and Linkable Format (ELF)

- Diagram. [ELF Executable_and_Linkable_Format diagram](img/ELF_Executable_and_Linkable_Format_diagram_by_Ange_Albertini.png) [[Source](https://upload.wikimedia.org/wikipedia/commons/e/e4/ELF_Executable_and_Linkable_Format_diagram_by_Ange_Albertini.png)]
- [Executable and Linkable Format - Wikipedia](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format)
- [HW3 - 238P Operating Systems](https://ics.uci.edu/~aburtsev/238P/hw/hw3-elf/hw3-elf.html)
- [Introduction to the ELF Format Part II : Understanding Program Headers](https://blog.k3170makan.com/2018/09/introduction-to-elf-format-part-ii.html)
- [Tiny ELF Files: Revisited in 2021](https://nathanotterness.com/2021/10/tiny_elf_modernized.html)

## Links of interest and references

* [Intel manuals](https://software.intel.com/en-us/articles/intel-sdm)
* [x86 and amd64 instruction reference](https://www.felixcloutier.com/x86/index.html)
* Jorgensen, E. [x86-64 Assembly Language Programming with Ubuntu](http://www.egr.unlv.edu/~ed/assembly64.pdf)
* Boldyshev & Rideau. (2000). [Linux Assembly HOWTO](http://www.mit.edu/afs.new/athena/system/rhlinux/redhat-6.2-docs/HOWTOS/other-formats/pdf/Assembly-HOWTO.pdf)
* Ray Toal. [x86 Assembly Language Programming](https://cs.lmu.edu/~ray/notes/x86assembly/)
* Hoey, J. V. (2019). [Beginning x64 Assembly Programming](http://www.google.com.br/books/edition/Beginning_x64_Assembly_Programming/mSa7DwAAQBAJ).
* Miller, A. R. (1986). [Assembly Language Techniques for the IBM PC](https://www.google.com.br/books/edition/Assembly_Language_Techniques_for_the_IBM/0FsgAQAAIAAJ).
* Aaron Beckendorf. (2025). [A Forth OS In 46 Bytes](https://hackaday.com/2025/05/27/a-forth-os-in-46-bytes/)

<br><sub>Last edited: 2025-06-09 12:40:28</sub>
