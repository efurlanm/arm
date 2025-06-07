# Environment (Termux)

The processor/soc is: Snapdragon 617 8x Cortex-A53 NEON ARMv8-A


```python
! pkg install inxi -y
```

    Checking availability of current mirror:
    [*] https://mirrors.zju.edu.cn/termux/apt/termux-main: ok
    Reading package lists... Done
    Building dependency tree... Done
    Reading state information... Done
    The following NEW packages will be installed:
      inxi
    0 upgraded, 1 newly installed, 0 to remove and 21 not upgraded.
    Need to get 349 kB of archives.
    After this operation, 1458 kB of additional disk space will be used.
    Get:1 https://mirrors.zju.edu.cn/termux/apt/termux-main stable/main aarch64 inxi all 3.3.38-1-0 [349 kB]
    Fetched 349 kB in 27s (12.8 kB/s)                                              [0m[33m
    
    7[0;23r8[1ASelecting previously unselected package inxi.
    (Reading database ... 24569 files and directories currently installed.)
    Preparing to unpack .../inxi_3.3.38-1-0_all.deb ...
    7[24;0f[42m[30mProgress: [  0%][49m[39m [..........................................................] 87[24;0f[42m[30mProgress: [ 20%][49m[39m [###########...............................................] 8Unpacking inxi (3.3.38-1-0) ...
    7[24;0f[42m[30mProgress: [ 40%][49m[39m [#######################...................................] 8Setting up inxi (3.3.38-1-0) ...
    7[24;0f[42m[30mProgress: [ 60%][49m[39m [##################################........................] 87[24;0f[42m[30mProgress: [ 80%][49m[39m [##############################################............] 8
    7[0;24r8[1A[J


```python
! inxi
```

    [1;34mCPU:[0m 2x 4-core AArch64 (-MCP AMP-) [1;34mspeed/min/max:[0m 332/499:403/1651:1210 MHz[0m
    [1;34mKernel:[0m 3.10.108-lk.r17_rev aarch64 [1;34mUp:[0m 1h 49m [1;34mMem:[0m 1.14/1.8 GiB (63.2%)[0m
    [1;34mStorage:[0m 14.56 GiB (198.6% used) [1;34mProcs:[0m 12 [1;34mShell:[0m python3.12 [1;34minxi:[0m 3.3.38[0m



```python
! inxi -Cf
```

    [1;34mCPU:[0m
      [1;34mInfo:[0m 2x 4-core [1;34mmodel:[0m AArch64 [1;34mbits:[0m 64 [1;34mtype:[0m MCP AMP[0m
      [1;34mSpeed (MHz):[0m [1;34mavg:[0m 332 [1;34mmin/max:[0m 499:403/1651:1210 [1;34mcores:[0m [1;34m1:[0m 0 [1;34m2:[0m 0 [1;34m3:[0m 499[0m
        [1;34m4:[0m 499 [1;34m5:[0m 499 [1;34m6:[0m 499[0m
      [1;34mFeatures:[0m aes asimd crc32 evtstrm fp pmull sha1 sha2[0m



```python
! inxi -F
```

    [1;34mSystem:[0m
      [1;34mHost:[0m localhost [1;34mKernel:[0m 3.10.108-lk.r17_rev [1;34march:[0m aarch64 [1;34mbits:[0m 64[0m
      [1;34mConsole:[0m pty pts/3 [1;34mDistro:[0m Android[0m
    [1;34mMachine:[0m
      [1;34mType:[0m ARM [1;34mSystem:[0m Athene_13MP [1;34mdetails:[0m Qualcomm MSM8952 [1;34mrev:[0m 82ad[0m
    [1;34mBattery:[0m
      [1;34mID-1:[0m battery [1;34mcharge:[0m 100% [1;34mcondition:[0m N/A[0m
    [1;34mCPU:[0m
      [1;34mInfo:[0m 2x 4-core [1;34mmodel:[0m AArch64 [1;34mvariant:[0m armv8 [1;34mbits:[0m 64 [1;34mtype:[0m MCP AMP[0m
      [1;34mSpeed (MHz):[0m [1;34mavg:[0m 332 [1;34mmin/max:[0m 499:403/1651:1210 [1;34mcores:[0m [1;34m1:[0m 0 [1;34m2:[0m 0 [1;34m3:[0m 499[0m
        [1;34m4:[0m 499 [1;34m5:[0m 499 [1;34m6:[0m 499[0m
    [1;34mGraphics:[0m
      [1;34mDevice-1:[0m msm-dai-q6-hdmi [1;34mdriver:[0m msm_dai_q6_hdmi [1;34mv:[0m N/A[0m
      [1;34mDevice-2:[0m msm-dai-q6-mi2s-hdmi [1;34mdriver:[0m msm_dai_q6_mi2s_hdmi [1;34mv:[0m N/A[0m
      [1;34mDisplay:[0m [1;34mserver:[0m No display server data found. Headless machine?[0m
        [1;34mtty:[0m 80x40[0m
      [1;34mAPI:[0m N/A [1;34mMessage:[0m No API data available in console. Headless machine?[0m
      [1;34mInfo:[0m [1;34mTools:[0m No graphics tools found.[0m
    [1;34mAudio:[0m
      [1;34mDevice-1:[0m msm8952-audio-codec [1;34mdriver:[0m msm8952_asoc_wcd[0m
      [1;34mDevice-2:[0m msm-audio-ion [1;34mdriver:[0m msm_audio_ion[0m
      [1;34mDevice-3:[0m msm-dai-q6-hdmi [1;34mdriver:[0m msm_dai_q6_hdmi[0m
      [1;34mDevice-4:[0m msm-dai-q6-mi2s-hdmi [1;34mdriver:[0m msm_dai_q6_mi2s_hdmi[0m
      [1;34mDevice-5:[0m msmapr-audio [1;34mdriver:[0m adsp_audio[0m
      [1;34mAPI:[0m ALSA [1;34mv:[0m k3.10.108-lk.r17_rev [1;34mstatus:[0m kernel-api[0m
    [1;34mNetwork:[0m
      [1;34mDevice-1:[0m wcnss_wlan [1;34mdriver:[0m wcnss_wlan[0m
      [1;34mIF:[0m p2p0 [1;34mstate:[0m down [1;34mmac:[0m 6a:c4:4d:c0:cd:56[0m
      [1;34mIF-ID-1:[0m dummy0 [1;34mstate:[0m unknown [1;34mspeed:[0m N/A [1;34mduplex:[0m N/A[0m
        [1;34mmac:[0m a6:02:8d:88:71:be[0m
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
      [1;34mIF-ID-21:[0m usb0 [1;34mstate:[0m down [1;34mmac:[0m 12:40:d1:e7:c7:30[0m
      [1;34mIF-ID-22:[0m wlan0 [1;34mstate:[0m up [1;34mmac:[0m 68:c4:4d:c0:cd:56[0m
    [1;34mDrives:[0m
      [1;34mLocal Storage:[0m [1;34mtotal:[0m 14.56 GiB [1;34mused:[0m 28.92 GiB (198.6%)[0m
      [1;34mID-1:[0m /dev/mmcblk0 [1;34mmodel:[0m QE13MB [1;34msize:[0m 14.56 GiB[0m
    [1;34mPartition:[0m
      [1;34mID-1:[0m /cache [1;34msize:[0m 463.9 MiB [1;34mused:[0m 352 KiB (0.1%) [1;34mfs:[0m n/a[0m
        [1;34mdev:[0m /dev/mmcblk0p46[0m
      [1;34mID-2:[0m /data [1;34msize:[0m 21.65 GiB [1;34mused:[0m 12.61 GiB (58.2%) [1;34mfs:[0m n/a[0m
        [1;34mdev:[0m /dev/mmcblk0p48[0m
      [1;34mID-3:[0m /firmware [1;34msize:[0m 188.8 MiB [1;34mused:[0m 139.2 MiB (73.7%) [1;34mfs:[0m n/a[0m
        [1;34mdev:[0m /dev/mmcblk0p1[0m
      [1;34mID-4:[0m /system [1;34msize:[0m 4.77 GiB [1;34mused:[0m 3.69 GiB (77.4%) [1;34mfs:[0m n/a[0m
        [1;34mdev:[0m /dev/mmcblk0p47[0m
    [1;34mSwap:[0m
      [1;34mID-1:[0m swap-1 [1;34mtype:[0m zram [1;34msize:[0m 1024 MiB [1;34mused:[0m 506.5 MiB (49.5%)[0m
        [1;34mdev:[0m /dev/block/zram0[0m
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    Use of uninitialized value in substitution (s///) at /data/data/com.termux/files/usr/bin/inxi line 27663.
    Use of uninitialized value in concatenation (.) or string at /data/data/com.termux/files/usr/bin/inxi line 27664.
    [1;34mSensors:[0m
      [1;34mSrc:[0m /sys [1;34mSystem Temperatures:[0m [1;34mcpu:[0m 31.2 C [1;34mmobo:[0m N/A[0m
      [1;34mFan Speeds (rpm):[0m N/A[0m
    [1;34mInfo:[0m
      [1;34mMemory:[0m [1;34mtotal:[0m N/A [1;34mavailable:[0m 1.8 GiB [1;34mused:[0m 1.14 GiB (63.5%)[0m
      [1;34mProcesses:[0m 12 [1;34mUptime:[0m 1h 50m [1;34mInit:[0m N/A [1;34mShell:[0m python3.12 [1;34minxi:[0m 3.3.38[0m


TOP:

![top.png](environment-617_files/3914c755-2550-4ca2-94cc-9a79d288ae89.png)


```python

```
