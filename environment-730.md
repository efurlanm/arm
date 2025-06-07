# Environment (Termux)

The processor/soc is: Snapdragon 730 2x Cortex-A76 + 6x Cortex-A55 NEON ARMv8.2-A


```python
! pkg install inxi -y
```

    Checking availability of current mirror:
    [*] https://repository.su/termux/termux-main/: ok
    Hit:1 https://turdl.kcubeterm.com tur-packages InRelease
    Hit:2 https://repository.su/termux/termux-main stable InRelease
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    All packages are up to date.
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following NEW packages will be installed:
      inxi
    0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
    Need to get 349 kB of archives.
    After this operation, 1458 kB of additional disk space will be used.
    Get:1 https://repository.su/termux/termux-main stable/main aarch64 inxi all 3.3.38-1-0 [349 kB]
    Fetched 349 kB in 3s (134 kB/s)[0m[33mm
    
    7[0;23r8[1ASelecting previously unselected package inxi.
    (Reading database ... 24582 files and directories currently installed.)
    Preparing to unpack .../inxi_3.3.38-1-0_all.deb ...
    7[24;0f[42m[30mProgress: [  0%][49m[39m [..........................................................] 87[24;0f[42m[30mProgress: [ 20%][49m[39m [###########...............................................] 8Unpacking inxi (3.3.38-1-0) ...
    7[24;0f[42m[30mProgress: [ 40%][49m[39m [#######################...................................] 8Setting up inxi (3.3.38-1-0) ...
    7[24;0f[42m[30mProgress: [ 60%][49m[39m [##################################........................] 87[24;0f[42m[30mProgress: [ 80%][49m[39m [##############################################............] 8
    7[0;24r8[1A[J


```python
! inxi
```

    [1;34mCPU:[0m 2x 6-core AArch64 (-MCP AMP-) [1;34mspeed/min/max:[0m 576/300/1805:2208 MHz[0m
    [1;34mKernel:[0m 4.14.190-27200287-abA715FXXSADXA2 aarch64 [1;34mUp:[0m 79d 13h 50m[0m
    [1;34mMem:[0m 3.11/5.4 GiB (57.7%) [1;34mStorage:[0m 113.71 GiB/Total N/A [1;34mProcs:[0m 8[0m
    [1;34mShell:[0m python3.12 [1;34minxi:[0m 3.3.38[0m



```python
! inxi -Cf
```

    [1;34mCPU:[0m
      [1;34mInfo:[0m 2x 6-core [1;34mmodel:[0m AArch64 [1;34mbits:[0m 64 [1;34mtype:[0m MCP AMP[0m
      [1;34mSpeed (MHz):[0m [1;34mavg:[0m 576 [1;34mmin/max:[0m 300/1805:2208 [1;34mcores:[0m [1;34m1:[0m 576 [1;34m2:[0m 576 [1;34m3:[0m 576[0m
        [1;34m4:[0m 576 [1;34m5:[0m 576 [1;34m6:[0m 576 [1;34m7:[0m 576 [1;34m8:[0m 576[0m
      [0m[1;34mFeatures:[0m aes asimd asimddp asimdhp asimdrdm atomics cpuid crc32 dcpop[0m
        [0mevtstrm fp fphp lrcpc pmull sha1 sha2[0m



```python
! inxi -F
```

    [1;34mSystem:[0m
      [1;34mHost:[0m localhost [1;34mKernel:[0m 4.14.190-27200287-abA715FXXSADXA2 [1;34march:[0m aarch64[0m
        [1;34mbits:[0m 64[0m
      [1;34mConsole:[0m pty pts/1 [1;34mDistro:[0m Android[0m
    [1;34mMachine:[0m
      [1;34mType:[0m ARM [1;34mSystem:[0m Qualcomm SDMMAGPIE[0m
    [1;34mCPU:[0m
      [1;34mInfo:[0m 2x 6-core [1;34mmodel:[0m AArch64 [1;34mbits:[0m 64 [1;34mtype:[0m MCP AMP[0m
      [1;34mSpeed (MHz):[0m [1;34mavg:[0m 576 [1;34mmin/max:[0m 300/1805:2208 [1;34mcores:[0m [1;34m1:[0m 576 [1;34m2:[0m 576 [1;34m3:[0m 576[0m
        [1;34m4:[0m 576 [1;34m5:[0m 576 [1;34m6:[0m 576 [1;34m7:[0m 576 [1;34m8:[0m 576[0m
    [1;34mGraphics:[0m
      [1;34mMessage:[0m No ARM data found for this feature.[0m
      [1;34mDisplay:[0m [1;34mserver:[0m No display server data found. Headless machine?[0m
        [1;34mtty:[0m 80x40[0m
      [1;34mAPI:[0m N/A [1;34mMessage:[0m No API data available in console. Headless machine?[0m
      [1;34mInfo:[0m [1;34mTools:[0m No graphics tools found.[0m
    [1;34mAudio:[0m
      [1;34mMessage:[0m No ARM data found for this feature.[0m
    [1;34mNetwork:[0m
      [1;34mMessage:[0m No ARM data found for this feature.[0m
    [1;34mDrives:[0m
      [1;34mLocal Storage:[0m [1;34mtotal:[0m 0 KiB [1;34mused:[0m 113.68 GiB[0m
    [1;34mPartition:[0m
      [1;34mID-1:[0m / [1;34msize:[0m 4.93 GiB [1;34mused:[0m 4.91 GiB (99.5%) [1;34mfs:[0m n/a [1;34mdev:[0m /dev/dm-4[0m
      [1;34mID-2:[0m /cache [1;34msize:[0m 389.7 MiB [1;34mused:[0m 21.7 MiB (5.6%) [1;34mfs:[0m n/a [1;34mdev:[0m /dev/sda28[0m
      [1;34mID-3:[0m /data [1;34msize:[0m 109.65 GiB [1;34mused:[0m 53.06 GiB (48.4%) [1;34mfs:[0m n/a[0m
        [1;34mdev:[0m /dev/sda32[0m
    [1;34mSwap:[0m
      [1;34mAlert:[0m No swap data was found.[0m
    [1;34mSensors:[0m
      [1;34mSrc:[0m /sys [1;34mMessage:[0m No sensor data found in /sys/class/hwmon.[0m
    [1;34mInfo:[0m
      [1;34mMemory:[0m [1;34mtotal:[0m N/A [1;34mavailable:[0m 5.4 GiB [1;34mused:[0m 3.12 GiB (57.9%)[0m
      [1;34mProcesses:[0m 8 [1;34mUptime:[0m 79d 13h 51m [1;34mInit:[0m N/A [1;34mShell:[0m python3.12 [1;34minxi:[0m 3.3.38[0m



```python

```
