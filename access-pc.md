# Access to the JL server running on Termux

This Notebook runs on the PC and configures access to the JL server running on Termux. Assuming Termux and SSH server are running.


```python
! ssh -TNf g4
```

The command `ssh -NfT g4` is used to establish a **non-interactive SSH connection** that runs in the **background**.

Start the JL server in Termux:

JL can be accessed on the PC using the address <http://g4:8889/lab> in the browser.

Mount the file system:


```bash
%%bash
OPT="uid=$(id -u),gid=$(id -g),reconnect,cache=yes,kernel_cache,compression=no,ServerAliveCountMax=3"
sshfs  g4:/data/data/com.termux/files/home  /mnt/g4  -o $OPT
sshfs  g4:/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu   /mnt/g4u  -o $OPT
```

## Shutdown


```python
! sudo umount /mnt/g4 /mnt/g4u
```


```python
! ssh -T g4 'proot-distro login ubuntu -- bash -lc "killall jupyter-lab"'
```

    proot warning: can't sanitize binding "/proc/self/fd/2": No such file or directory
    proot warning: can't sanitize binding "/proc/self/fd/1": No such file or directory
    proot warning: can't sanitize binding "/proc/self/fd/0": No such file or directory
    jupyter-lab: no process found



```python
! ssh -O exit g4
```

    Exit request sent.



```python

```
