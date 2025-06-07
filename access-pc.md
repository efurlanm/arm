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

    fusermount3: failed to access mountpoint /mnt/g4: Permission denied



    ---------------------------------------------------------------------------

    CalledProcessError                        Traceback (most recent call last)

    Cell In[7], line 1
    ----> 1 get_ipython().run_cell_magic('bash', '', 'OPT="uid=$(id -u),gid=$(id -g),reconnect,cache=yes,kernel_cache,compression=no,ServerAliveCountMax=3"\nsshfs  g4:/data/data/com.termux/files/home  /mnt/g4  -o $OPT\n')


    File ~/conda/lib/python3.12/site-packages/IPython/core/interactiveshell.py:2547, in InteractiveShell.run_cell_magic(self, magic_name, line, cell)
       2545 with self.builtin_trap:
       2546     args = (magic_arg_s, cell)
    -> 2547     result = fn(*args, **kwargs)
       2549 # The code below prevents the output from being displayed
       2550 # when using magics with decorator @output_can_be_silenced
       2551 # when the last Python token in the expression is a ';'.
       2552 if getattr(fn, magic.MAGIC_OUTPUT_CAN_BE_SILENCED, False):


    File ~/conda/lib/python3.12/site-packages/IPython/core/magics/script.py:159, in ScriptMagics._make_script_magic.<locals>.named_script_magic(line, cell)
        157 else:
        158     line = script
    --> 159 return self.shebang(line, cell)


    File ~/conda/lib/python3.12/site-packages/IPython/core/magics/script.py:336, in ScriptMagics.shebang(self, line, cell)
        331 if args.raise_error and p.returncode != 0:
        332     # If we get here and p.returncode is still None, we must have
        333     # killed it but not yet seen its return code. We don't wait for it,
        334     # in case it's stuck in uninterruptible sleep. -9 = SIGKILL
        335     rc = p.returncode or -9
    --> 336     raise CalledProcessError(rc, cell)


    CalledProcessError: Command 'b'OPT="uid=$(id -u),gid=$(id -g),reconnect,cache=yes,kernel_cache,compression=no,ServerAliveCountMax=3"\nsshfs  g4:/data/data/com.termux/files/home  /mnt/g4  -o $OPT\n'' returned non-zero exit status 1.


## Shutdown


```python
! ssh -T g4 'pkill -f jupyter'
```


```python
! ssh -O exit g4
```

    Exit request sent.



```python

```
