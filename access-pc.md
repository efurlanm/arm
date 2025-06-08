# Access to the JL server running on Termux

This Notebook runs on the PC and configures access to the JL server running on Termux. Assuming Termux and SSH server are running.


```python
! ssh -TNf g4
```

The command `ssh -NfT g4` is used to establish a **non-interactive SSH connection** that runs in the **background**.

Start the JL server in Termux:


```python
! ssh -T g4 'jupyter-lab --no-browser --ip=* --IdentityProvider.token='' --notebook-dir=~ >/dev/null 2>&1 &'
```

At this point JL can be accessed on the PC using the address <http://g4:8888/lab?> in the browser.

Mount the file system:


```bash
%%bash
OPT="uid=$(id -u),gid=$(id -g),reconnect,cache=yes,kernel_cache,compression=no,ServerAliveCountMax=3"
sshfs  g4:/data/data/com.termux/files/home  /mnt/g4  -o $OPT
```

## Shutdown


```python
! sudo umount /mnt/g4
```


```python
! ssh -T g4 'pkill -f jupyter'
```


```python
! ssh -O exit g4
```

    Exit request sent.



```python

```
