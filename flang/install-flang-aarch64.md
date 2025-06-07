# Install Flang on aarch64


```python
import sys
print("User Current Version:-", sys.version)
```

    User Current Version:- 3.11.1 (main, Jan 16 2023, 08:53:45) [Clang 14.0.6 (https://android.googlesource.com/toolchain/llvm-project 4c603efb0



```python
!pkg search gfortran
```

    No mirror or mirror group selected. You might want to select one by running 'termux-change-repo'
    Checking availability of current mirror:
    [*] https://mirrors.bfsu.edu.cn/termux/apt/termux-main: bad
    Testing the available mirrors:
    [*] (10) https://packages-cf.termux.dev/apt/termux-main: ok
    [*] (1) https://mirrors.cbrx.io/apt/termux/termux-main: ok
    [*] (1) https://packages.nscdn.top/termux-main: bad
    [*] (1) https://linux.domainesia.com/applications/termux/termux-main: ok
    [*] (1) https://mirror.nevacloud.com/applications/termux/termux-main: ok
    [*] (1) https://mirror.bardia.tech/termux/termux-main: ok
    [*] (1) https://mirror.textcord.xyz/termux/termux-main: bad
    [*] (1) https://mirror.albony.xyz/termux/termux-main: ok
    [*] (1) https://mirror.iscas.ac.cn/termux/apt/termux-main: ok
    [*] (1) https://mirrors.hit.edu.cn/termux/apt/termux-main: ok
    [*] (1) https://mirrors.ustc.edu.cn/termux/apt/termux-main: ok
    [*] (1) https://mirrors.nju.edu.cn/termux/apt/termux-main: bad
    [*] (1) https://mirrors.scau.edu.cn/termux/apt/termux-main: bad
    [*] (1) https://mirrors.tuna.tsinghua.edu.cn/termux/apt/termux-main: ok
    [*] (1) https://mirrors.pku.edu.cn/termux/termux-main/: ok
    [*] (1) https://mirrors.sau.edu.cn/termux/apt/termux-main: ok
    [*] (1) https://mirrors.bfsu.edu.cn/termux/apt/termux-main: bad
    [*] (1) https://mirrors.aliyun.com/termux/termux-main: ok
    [*] (1) https://mirrors.njupt.edu.cn/termux/apt/termux-main: bad
    [*] (1) https://mirrors.dgut.edu.cn/termux/apt/termux-main: bad
    [*] (1) https://mirrors.sdu.edu.cn/termux/termux-main: ok
    [*] (1) https://mirror.nyist.edu.cn/termux/apt/termux-main: ok
    [*] (1) https://mirrors.cqupt.edu.cn/termux/apt/termux-main: bad
    [*] (1) https://mirrors.sustech.edu.cn/termux/apt/termux-main: ok
    [*] (1) https://termux.astra.in.ua/apt/termux-main: ok
    [*] (1) https://packages.termux.dev/apt/termux-main: ok
    [*] (1) https://mirror.termux.dev/termux-main: ok
    [*] (4) https://grimler.se/termux/termux-main: ok
    [*] (1) https://termux.3san.dev/termux/termux-main: ok
    [*] (1) https://termux.cdn.lumito.net/termux-main: ok
    [*] (1) https://mirrors.sahilister.in/termux/termux-main: ok
    [*] (1) https://termux.librehat.com/apt/termux-main: ok
    [*] (1) https://termux.mentality.rip/termux-main: ok
    [*] (1) https://mirror.accum.se/mirror/termux.dev/termux-main: ok
    [*] (1) https://mirror.mwt.me/termux/main: ok
    [*] (1) https://dl.kcubeterm.com/termux-main: ok
    [*] (1) https://plug-mirror.rcac.purdue.edu/termux/termux-main: ok
    [*] (1) https://mirrors.utermux.dev/termux/termux-main: ok
    [*] (1) https://mirror.csclub.uwaterloo.ca/termux/termux-main: ok
    [*] (1) https://mirror.fcix.net/termux/termux-main: ok
    [*] (1) https://mirror.vern.cc/termux/termux-main: ok
    [*] (1) https://mirror.mwt.me/termux/main: ok
    [*] (1) https://mirror.surf/termux/termux-main/: ok
    [*] (1) http://mirror.mephi.ru/termux/termux-main: ok
    Picking mirror: (29) /data/data/com.termux/files/usr/etc/termux/mirrors/europe/grimler.se
    Get:1 https://grimler.se/termux/termux-main stable InRelease [14.0 kB]
    Get:2 https://grimler.se/termux/termux-main stable/main aarch64 Packages [485 kB]
    Fetched 499 kB in 4s (112 kB/s)   [0mm[33m[33m[33m
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    2 packages can be upgraded. Run 'apt list --upgradable' to see them.
    Sorting... Done
    Full Text Search... Done



```python
!curl -LO https://its-pointless.github.io/setup-pointless-repo.sh
```

      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100  1116  100  1116    0     0    536      0  0:00:02  0:00:02 --:--:--   539



```python
!bash setup-pointless-repo.sh
```

    Hit:1 https://grimler.se/termux/termux-main stable InRelease
    Reading package lists... Done
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    Calculating upgrade... Done
    The following packages will be upgraded:
      command-not-found gpgv
    2 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
    Need to get 391 kB of archives.
    After this operation, 0 B of additional disk space will be used.
    Get:1 https://grimler.se/termux/termux-main stable/main aarch64 gpgv aarch64 2.4.0-2 [175 kB]
    Get:2 https://grimler.se/termux/termux-main stable/main aarch64 command-not-found aarch64 2.1.0-7 [217 kB]
    Fetched 391 kB in 3s (150 kB/s)        
    (Reading database ... 16324 files and directories currently installed.)
    Preparing to unpack .../gpgv_2.4.0-2_aarch64.deb ...
    Unpacking gpgv (2.4.0-2) over (2.4.0-1) ...
    Setting up gpgv (2.4.0-2) ...
    (Reading database ... 16324 files and directories currently installed.)
    Preparing to unpack .../command-not-found_2.1.0-7_aarch64.deb ...
    Unpacking command-not-found (2.1.0-7) over (2.1.0-6) ...
    Setting up command-not-found (2.1.0-7) ...
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    coreutils is already the newest version (9.1-2).
    The following additional packages will be installed:
      libksba pinentry
    Suggested packages:
      scdaemon
    The following NEW packages will be installed:
      gnupg libksba pinentry
    0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
    Need to get 1472 kB of archives.
    After this operation, 6111 kB of additional disk space will be used.
    Get:1 https://grimler.se/termux/termux-main stable/main aarch64 libksba aarch64 1.6.3 [103 kB]
    Get:2 https://grimler.se/termux/termux-main stable/main aarch64 pinentry aarch64 1.2.1-1 [44.9 kB]
    Get:3 https://grimler.se/termux/termux-main stable/main aarch64 gnupg aarch64 2.4.0-2 [1323 kB]
    Fetched 1472 kB in 4s (359 kB/s)
    Selecting previously unselected package libksba.
    (Reading database ... 16324 files and directories currently installed.)
    Preparing to unpack .../libksba_1.6.3_aarch64.deb ...
    Unpacking libksba (1.6.3) ...
    Selecting previously unselected package pinentry.
    Preparing to unpack .../pinentry_1.2.1-1_aarch64.deb ...
    Unpacking pinentry (1.2.1-1) ...
    Selecting previously unselected package gnupg.
    Preparing to unpack .../gnupg_2.4.0-2_aarch64.deb ...
    Unpacking gnupg (2.4.0-2) ...
    Setting up libksba (1.6.3) ...
    Setting up pinentry (1.2.1-1) ...
    Setting up gnupg (2.4.0-2) ...
    Get:1 https://its-pointless.github.io/files/21 termux InRelease [8982 B]
    Hit:2 https://grimler.se/termux/termux-main stable InRelease                  [0m[33m
    Get:3 https://its-pointless.github.io/files/21 termux/extras all Packages [1572 B]
    Get:4 https://its-pointless.github.io/files/21 termux/extras aarch64 Packages [36.2 kB]
    Fetched 46.8 kB in 3s (16.3 kB/s)m[33m[33m[33m
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    All packages are up to date.



```python
!pkg upgrade
```

    No mirror or mirror group selected. You might want to select one by running 'termux-change-repo'
    Checking availability of current mirror:
    [*] https://grimler.se/termux/termux-main: ok
    Hit:1 https://its-pointless.github.io/files/21 termux InRelease     [0m
    Hit:2 https://grimler.se/termux/termux-main stable InRelease        [33m[33m[33m
    Reading package lists... Done[33m[33m
    Building dependency tree... Done
    Reading state information... Done
    All packages are up to date.
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    Calculating upgrade... Done
    0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.



```python
!pkg search gfortran
```

    No mirror or mirror group selected. You might want to select one by running 'termux-change-repo'
    Checking availability of current mirror:
    [*] https://grimler.se/termux/termux-main: ok
    Sorting... Done
    Full Text Search... Done
    [32mlibgfortran3[0m/termux 6.5.0-2 aarch64
      dynamic library for fortran
    
    [32mlibgfortran4[0m/termux 7.4.0-2 aarch64
      dynamic library for fortran
    
    [32mlibgfortran5[0m/termux 8.3.0-3 aarch64
      dynamic library for fortran
    



```python
!pkg install libgfortran5
```

    No mirror or mirror group selected. You might want to select one by running 'termux-change-repo'
    Checking availability of current mirror:
    [*] https://grimler.se/termux/termux-main: ok
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following NEW packages will be installed:
      libgfortran5
    0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
    Need to get 219 kB of archives.
    After this operation, 1118 kB of additional disk space will be used.
    Get:1 https://its-pointless.github.io/files/21 termux/extras aarch64 libgfortran5 aarch64 8.3.0-3 [219 kB]
    Fetched 219 kB in 0s (497 kB/s)  [0m[33m
    
    7[0;23r8[1ASelecting previously unselected package libgfortran5.
    (Reading database ... 16421 files and directories currently installed.)
    Preparing to unpack .../libgfortran5_8.3.0-3_aarch64.deb ...
    7[24;0f[42m[30mProgress: [  0%][49m[39m [..........................................................] 87[24;0f[42m[30mProgress: [ 20%][49m[39m [###########...............................................] 8Unpacking libgfortran5 (8.3.0-3) ...
    7[24;0f[42m[30mProgress: [ 40%][49m[39m [#######################...................................] 8Setting up libgfortran5 (8.3.0-3) ...
    7[24;0f[42m[30mProgress: [ 60%][49m[39m [##################################........................] 87[24;0f[42m[30mProgress: [ 80%][49m[39m [##############################################............] 8
    7[0;24r8[1A[J


```python
!pkg search gcc
```

    No mirror or mirror group selected. You might want to select one by running 'termux-change-repo'
    Checking availability of current mirror:
    [*] https://grimler.se/termux/termux-main: ok
    Sorting... Done
    Full Text Search... Done
    [32mgcc-6[0m/termux 6.5.0-2 aarch64
      GNU C compiler
    
    [32mgcc-7[0m/termux 7.4.0-2 aarch64
      GNU C compiler
    
    [32mgcc-8[0m/termux 8.3.0-3 aarch64
      GNU C compiler
    
    [32mlibgccjit-8-dev[0m/termux 8.3.0-3 aarch64
      GCC just-in-time compilation
    
    [32mlibgomp-7[0m/termux 7.4.0-2 aarch64
      openmp library for gcc
    
    [32mlibgomp-8[0m/termux 8.3.0-3 aarch64
      openmp library for gcc-8
    
    [32mmingw-w64-gcc-libs[0m/stable 12.2.0 all
      Libraries coming with GCC (libgcc, libstdc++, etc.)
    



```python
!pkg install -y gcc-8
```

    No mirror or mirror group selected. You might want to select one by running 'termux-change-repo'
    Checking availability of current mirror:
    [*] https://grimler.se/termux/termux-main: ok
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following additional packages will be installed:
      binutils binutils-bin binutils-libs libisl libmpc setup-scripts
    The following NEW packages will be installed:
      binutils binutils-bin binutils-libs gcc-8 libisl libmpc setup-scripts
    0 upgraded, 7 newly installed, 0 to remove and 0 not upgraded.
    Need to get 26.7 MB of archives.
    After this operation, 113 MB of additional disk space will be used.
    Get:1 https://its-pointless.github.io/files/21 termux/extras all setup-scripts all 2.6.6 [3184 B]
    Get:2 https://grimler.se/termux/termux-main stable/main aarch64 binutils-libs aarch64 2.40 [1039 kB]
    Get:3 https://its-pointless.github.io/files/21 termux/extras aarch64 gcc-8 aarch64 8.3.0-3 [23.3 MB]
    Get:4 https://grimler.se/termux/termux-main stable/main aarch64 binutils-bin aarch64 2.40 [1686 kB]
    Get:5 https://grimler.se/termux/termux-main stable/main aarch64 binutils aarch64 2.40 [1160 B]
    Get:6 https://grimler.se/termux/termux-main stable/main aarch64 libmpc aarch64 1.3.1 [67.2 kB]
    Get:7 https://grimler.se/termux/termux-main stable/main aarch64 libisl aarch64 0.25 [647 kB]
    Fetched 26.7 MB in 7s (3644 kB/s)                                              [0m[33m[33m[33m
    
    7[0;23r8[1ASelecting previously unselected package binutils-libs.
    (Reading database ... 16430 files and directories currently installed.)
    Preparing to unpack .../0-binutils-libs_2.40_aarch64.deb ...
    7[24;0f[42m[30mProgress: [  0%][49m[39m [..........................................................] 87[24;0f[42m[30mProgress: [  3%][49m[39m [##........................................................] 8Unpacking binutils-libs (2.40) ...
    7[24;0f[42m[30mProgress: [  7%][49m[39m [####......................................................] 8Selecting previously unselected package binutils-bin.
    Preparing to unpack .../1-binutils-bin_2.40_aarch64.deb ...
    7[24;0f[42m[30mProgress: [ 10%][49m[39m [######....................................................] 8Unpacking binutils-bin (2.40) ...
    7[24;0f[42m[30mProgress: [ 14%][49m[39m [########..................................................] 8Selecting previously unselected package binutils.
    Preparing to unpack .../2-binutils_2.40_aarch64.deb ...
    7[24;0f[42m[30mProgress: [ 17%][49m[39m [#########.................................................] 8Unpacking binutils (2.40) ...
    7[24;0f[42m[30mProgress: [ 21%][49m[39m [############..............................................] 8Selecting previously unselected package libmpc.
    Preparing to unpack .../3-libmpc_1.3.1_aarch64.deb ...
    7[24;0f[42m[30mProgress: [ 24%][49m[39m [##############............................................] 8Unpacking libmpc (1.3.1) ...
    7[24;0f[42m[30mProgress: [ 28%][49m[39m [################..........................................] 8Selecting previously unselected package libisl.
    Preparing to unpack .../4-libisl_0.25_aarch64.deb ...
    7[24;0f[42m[30mProgress: [ 31%][49m[39m [##################........................................] 8Unpacking libisl (0.25) ...
    7[24;0f[42m[30mProgress: [ 34%][49m[39m [###################.......................................] 8Selecting previously unselected package setup-scripts.
    Preparing to unpack .../5-setup-scripts_2.6.6_all.deb ...
    7[24;0f[42m[30mProgress: [ 38%][49m[39m [######################....................................] 8Unpacking setup-scripts (2.6.6) ...
    7[24;0f[42m[30mProgress: [ 41%][49m[39m [########################..................................] 8Selecting previously unselected package gcc-8.
    Preparing to unpack .../6-gcc-8_8.3.0-3_aarch64.deb ...
    7[24;0f[42m[30mProgress: [ 45%][49m[39m [##########################................................] 8Unpacking gcc-8 (8.3.0-3) ...
    7[24;0f[42m[30mProgress: [ 48%][49m[39m [############################..............................] 8Setting up binutils-libs (2.40) ...
    7[24;0f[42m[30mProgress: [ 52%][49m[39m [#############################.............................] 87[24;0f[42m[30mProgress: [ 55%][49m[39m [################################..........................] 8Setting up libisl (0.25) ...
    7[24;0f[42m[30mProgress: [ 59%][49m[39m [##################################........................] 87[24;0f[42m[30mProgress: [ 62%][49m[39m [####################################......................] 8Setting up setup-scripts (2.6.6) ...
    7[24;0f[42m[30mProgress: [ 66%][49m[39m [######################################....................] 87[24;0f[42m[30mProgress: [ 69%][49m[39m [#######################################...................] 8Setting up libmpc (1.3.1) ...
    7[24;0f[42m[30mProgress: [ 72%][49m[39m [##########################################................] 87[24;0f[42m[30mProgress: [ 76%][49m[39m [############################################..............] 8Setting up binutils-bin (2.40) ...
    7[24;0f[42m[30mProgress: [ 79%][49m[39m [##############################################............] 87[24;0f[42m[30mProgress: [ 83%][49m[39m [################################################..........] 8Setting up binutils (2.40) ...
    7[24;0f[42m[30mProgress: [ 86%][49m[39m [##################################################........] 87[24;0f[42m[30mProgress: [ 90%][49m[39m [####################################################......] 8Setting up gcc-8 (8.3.0-3) ...
    7[24;0f[42m[30mProgress: [ 93%][49m[39m [#####################################################.....] 87[24;0f[42m[30mProgress: [ 97%][49m[39m [########################################################..] 8
    7[0;24r8[1A[J


```python
!gcc --version
```

    clang version 15.0.7
    Target: aarch64-unknown-linux-android24
    Thread model: posix
    InstalledDir: /data/data/com.termux/files/usr/bin



```python
!clang --version
```

    clang version 15.0.7
    Target: aarch64-unknown-linux-android24
    Thread model: posix
    InstalledDir: /data/data/com.termux/files/usr/bin



```python
!setupclang-gfort-8
```

    now using clang as default compiler with gfortran-8



```python
!pkg install -y coreutils
```

    No mirror or mirror group selected. You might want to select one by running 'termux-change-repo'
    Checking availability of current mirror:
    [*] https://grimler.se/termux/termux-main: ok
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    coreutils is already the newest version (9.1-2).
    0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.



```python
!gfortran --help
```

    CANNOT LINK EXECUTABLE "gfortran": library "libc++_shared.so" not found



```python
!pkg install libgfortran5
```

    No mirror or mirror group selected. You might want to select one by running 'termux-change-repo'
    Checking availability of current mirror:
    [*] https://grimler.se/termux/termux-main: ok
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    libgfortran5 is already the newest version (8.3.0-3).
    0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.



```python
!pkg remove -y libgfortran5
```

    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following packages will be REMOVED:
      libgfortran5
    0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
    After this operation, 1118 kB disk space will be freed.
    
    (Reading database ... 16967 files and directories currently installed.)
    Removing libgfortran5 (8.3.0-3) ...
    7[24;0f[42m[30mProgress: [  0%][49m[39m [..........................................................] 87[24;0f[42m[30mProgress: [ 33%][49m[39m [###################.......................................] 87[24;0f[42m[30mProgress: [ 67%][49m[39m [######################################....................] 8
    7[0;24r8[1A[J


```python
!pkg autoclean
```

    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    Del liblzma 5.4.0 [177 kB]
    Del xz-utils 5.4.0 [63.3 kB]
    Del dpkg 1.21.17 [291 kB]
    Del gpgv 2.4.0 [175 kB]
    Del ca-certificates 1:2022.10.11-1 [121 kB]
    Del unbound 1.17.0-1 [606 kB]
    Del termux-tools 1.35.0 [28.0 kB]
    Del apt 2.5.4 [965 kB]
    Del command-not-found 2.1.0-3 [217 kB]
    Del ed 1.18 [39.4 kB]
    Del lsof 4.96.5 [103 kB]
    Del nano 7.1 [219 kB]
    Del gpgv 2.4.0-1 [175 kB]



```python
!pkg install -y inxi
```

    No mirror or mirror group selected. You might want to select one by running 'termux-change-repo'
    Checking availability of current mirror:
    [*] https://grimler.se/termux/termux-main: ok
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following additional packages will be installed:
      perl
    The following NEW packages will be installed:
      inxi perl
    0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
    Need to get 14.9 MB of archives.
    After this operation, 71.3 MB of additional disk space will be used.
    Get:1 https://grimler.se/termux/termux-main stable/main aarch64 perl aarch64 5.36.0-1 [14.6 MB]
    Get:2 https://grimler.se/termux/termux-main stable/main aarch64 inxi all 3.3.24-1-0 [300 kB]m[33m[33m[33m[33m[33m[33m[33m[33m[33m[33m[33m[33m[33m[33m
    Fetched 14.9 MB in 14s (1038 kB/s)                                             [0m[33m
    
    7[0;23r8[1ASelecting previously unselected package perl.
    (Reading database ... 16961 files and directories currently installed.)
    Preparing to unpack .../perl_5.36.0-1_aarch64.deb ...
    7[24;0f[42m[30mProgress: [  0%][49m[39m [..........................................................] 87[24;0f[42m[30mProgress: [ 11%][49m[39m [######....................................................] 8Unpacking perl (5.36.0-1) ...
    7[24;0f[42m[30mProgress: [ 22%][49m[39m [############..............................................] 8Selecting previously unselected package inxi.
    Preparing to unpack .../inxi_3.3.24-1-0_all.deb ...
    7[24;0f[42m[30mProgress: [ 33%][49m[39m [###################.......................................] 8Unpacking inxi (3.3.24-1-0) ...
    7[24;0f[42m[30mProgress: [ 44%][49m[39m [#########################.................................] 8Setting up perl (5.36.0-1) ...
    7[24;0f[42m[30mProgress: [ 56%][49m[39m [################################..........................] 87[24;0f[42m[30mProgress: [ 67%][49m[39m [######################################....................] 8Setting up inxi (3.3.24-1-0) ...
    7[24;0f[42m[30mProgress: [ 78%][49m[39m [#############################################.............] 87[24;0f[42m[30mProgress: [ 89%][49m[39m [###################################################.......] 8
    7[0;24r8[1A[J


```python
!inxi -F
```

    [1;34mSystem:[0m
      [1;34mHost:[0m localhost [1;34mKernel:[0m 3.10.108-lk.r17_rev [1;34march:[0m aarch64 [1;34mbits:[0m 64[0m
        [1;34mConsole:[0m pty pts/2 [1;34mDistro:[0m Android[0m
    [1;34mMachine:[0m
      [1;34mType:[0m ARM [1;34mSystem:[0m Athene_13MP [1;34mdetails:[0m Qualcomm MSM8952 [1;34mrev:[0m 82ad[0m
    [1;34mBattery:[0m
      [1;34mID-1:[0m battery [1;34mcharge:[0m 100% [1;34mcondition:[0m N/A[0m
    [1;34mCPU:[0m
      [1;34mInfo:[0m 2x 4-core [1;34mmodel:[0m AArch64 [1;34mvariant:[0m armv8 [1;34mbits:[0m 64 [1;34mtype:[0m MCP AMP[0m
      [1;34mSpeed (MHz):[0m [1;34mavg:[0m 435 [1;34mmin/max:[0m 499:403/1651:1210 [1;34mcores:[0m [1;34m1:[0m 499 [1;34m2:[0m 499[0m
        [1;34m3:[0m 403 [1;34m4:[0m 403 [1;34m5:[0m 403 [1;34m6:[0m 403[0m
    [1;34mGraphics:[0m
      [1;34mDevice-1:[0m msm-dai-q6-hdmi [1;34mdriver:[0m msm_dai_q6_hdmi [1;34mv:[0m N/A[0m
      [1;34mDevice-2:[0m msm-dai-q6-mi2s-hdmi [1;34mdriver:[0m msm_dai_q6_mi2s_hdmi [1;34mv:[0m N/A[0m
      [1;34mDisplay:[0m [1;34mserver:[0m No display server data found. Headless machine?[0m
        [1;34mtty:[0m 80x40[0m
      [1;34mAPI:[0m N/A [0m[1;34mMessage:[0m No display API data available in console. Headless[0m
        [0mmachine?[0m
    [1;34mAudio:[0m
      [1;34mDevice-1:[0m msm8952-audio-codec [1;34mdriver:[0m msm8952_asoc_wcd[0m
      [1;34mDevice-2:[0m msm-audio-ion [1;34mdriver:[0m msm_audio_ion[0m
      [1;34mDevice-3:[0m msm-dai-q6-hdmi [1;34mdriver:[0m msm_dai_q6_hdmi[0m
      [1;34mDevice-4:[0m msm-dai-q6-mi2s-hdmi [1;34mdriver:[0m msm_dai_q6_mi2s_hdmi[0m
      [1;34mDevice-5:[0m msmapr-audio [1;34mdriver:[0m adsp_audio[0m
      [1;34mSound API:[0m ALSA [1;34mv:[0m k3.10.108-lk.r17_rev [1;34mrunning:[0m yes[0m
    [1;34mNetwork:[0m
      [1;34mDevice-1:[0m wcnss_wlan [1;34mdriver:[0m wcnss_wlan[0m
      [1;34mIF:[0m p2p0 [1;34mstate:[0m down [1;34mmac:[0m 6a:c4:4d:c0:cd:56[0m
      [1;34mIF-ID-1:[0m dummy0 [1;34mstate:[0m unknown [1;34mspeed:[0m N/A [1;34mduplex:[0m N/A[0m
        [1;34mmac:[0m 9a:60:cc:d5:97:ad[0m
      [1;34mIF-ID-2:[0m r_rmnet_data0 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-3:[0m r_rmnet_data1 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-4:[0m r_rmnet_data2 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-5:[0m r_rmnet_data3 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-6:[0m r_rmnet_data4 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-7:[0m r_rmnet_data5 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-8:[0m r_rmnet_data6 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-9:[0m r_rmnet_data7 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-10:[0m r_rmnet_data8 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-11:[0m rmnet_data0 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-12:[0m rmnet_data1 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-13:[0m rmnet_data2 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-14:[0m rmnet_data3 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-15:[0m rmnet_data4 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-16:[0m rmnet_data5 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-17:[0m rmnet_data6 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-18:[0m rmnet_data7 [1;34mstate:[0m down [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-19:[0m rmnet_ipa0 [1;34mstate:[0m unknown [1;34mspeed:[0m N/A [1;34mduplex:[0m N/A [1;34mmac:[0m N/A[0m
      [1;34mIF-ID-20:[0m sit0 [1;34mstate:[0m down [1;34mmac:[0m 00:00:00:00[0m
      [1;34mIF-ID-21:[0m usb0 [1;34mstate:[0m down [1;34mmac:[0m 12:19:44:d9:34:3c[0m
      [1;34mIF-ID-22:[0m wlan0 [1;34mstate:[0m up [1;34mmac:[0m 68:c4:4d:c0:cd:56[0m
    [1;34mDrives:[0m
      [1;34mLocal Storage:[0m [1;34mtotal:[0m 14.56 GiB [1;34mused:[0m 25.6 GiB (175.8%)[0m
      [1;34mID-1:[0m /dev/mmcblk0 [1;34mmodel:[0m QE13MB [1;34msize:[0m 14.56 GiB[0m
    [1;34mPartition:[0m
      [1;34mID-1:[0m /cache [1;34msize:[0m 463.9 MiB [1;34mused:[0m 352 KiB (0.1%) [1;34mfs:[0m n/a[0m
        [1;34mdev:[0m /dev/mmcblk0p46[0m
      [1;34mID-2:[0m /data [1;34msize:[0m 21.65 GiB [1;34mused:[0m 10.95 GiB (50.6%) [1;34mfs:[0m n/a[0m
        [1;34mdev:[0m /dev/mmcblk0p48[0m
      [1;34mID-3:[0m /firmware [1;34msize:[0m 188.8 MiB [1;34mused:[0m 139.2 MiB (73.7%) [1;34mfs:[0m n/a[0m
        [1;34mdev:[0m /dev/mmcblk0p1[0m
      [1;34mID-4:[0m /system [1;34msize:[0m 4.77 GiB [1;34mused:[0m 3.69 GiB (77.4%) [1;34mfs:[0m n/a[0m
        [1;34mdev:[0m /dev/mmcblk0p47[0m
    [1;34mSwap:[0m
      [1;34mID-1:[0m swap-1 [1;34mtype:[0m zram [1;34msize:[0m 1024 MiB [1;34mused:[0m 323.9 MiB (31.6%)[0m
        [1;34mdev:[0m /dev/block/zram0[0m
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 24234.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 24235.
    [1;34mSensors:[0m
      [1;34mSrc:[0m /sys [1;34mSystem Temperatures:[0m [1;34mcpu:[0m 36.0 C [1;34mmobo:[0m N/A[0m
      [1;34mFan Speeds (RPM):[0m N/A[0m
    [1;34mInfo:[0m
      [1;34mProcesses:[0m 9 [1;34mUptime:[0m 3d 9h 29m [1;34mMemory:[0m 1.8 GiB [1;34mused:[0m 1.11 GiB (61.5%)[0m
      [1;34mInit:[0m N/A [1;34mShell:[0m python3.11 [1;34minxi:[0m 3.3.24[0m



```python
!df -h
```

    Filesystem            Size  Used Avail Use% Mounted on
    tmpfs                 912M  388K  911M   1% /dev
    tmpfs                 912M     0  912M   0% /mnt
    /dev/block/mmcblk0p30  27M  492K   26M   2% /mnt/vendor/persist
    /dev/block/mmcblk0p47 2.3G  1.8G  535M  78% /system
    /dev/block/mmcblk0p46 232M  176K  224M   1% /cache
    /dev/block/mmcblk0p16 1.9M  1.9M     0 100% /fsg
    /dev/block/mmcblk0p1   94M   70M   23M  76% /firmware
    /dev/block/mmcblk0p12  12M  3.6M  7.7M  32% /dsp
    /dev/block/mmcblk0p48  11G  5.4G  5.2G  51% /data
    /data/media            11G  5.4G  5.2G  51% /storage/emulated



```python

```
