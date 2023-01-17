### Simplest Method 

Patch the boot.img via Magisk and load that via fastboot. 

```
> adb reboot bootloader
> fastboot boot .\redfin-tp1a.221005.002-factory-3c13ab73\magisk_patched-25200_Knyqr.img
Sending 'boot.img' (98304 KB)                      OKAY [  3.242s]
Booting                                            (bootloader) boot.img missing cmdline or OS version
```

After boot: 
```
> adb shell
redfin:/ $ su
redfin:/ # id
uid=0(root) gid=0(root) groups=0(root) context=u:r:magisk:s0
```

#### Android Rooting Guide - [Pixel 5]


1. Unlock Bootloader - If `adb devices` work but fastboot doesn't detect the device, install the fastbooot drivers. 

2. Get the latest [TWRP cutom recovery image](https://twrp.me/) to flash the Magisk binary in the next step 

3. Get the Magisk APK from [Github](https://github.com/topjohnwu/Magisk). Since the devs have merged the app file and flashable file into one single package, rename the .apk to .zip. 

4. Push this image via adb 

` adb push .\Magisk-v25.2.zip / `

5. Reboot into bootaloader and boot into custome recovery -

```
 adb reboot bootloader
 fastboot boot .\twrp-redfin.img
```
6. Flash the Magisk zip from Step 3, and we are good to go!

```
>adb shell
redfin:/ $ su
redfin:/ # id
uid=0(root) gid=0(root) groups=0(root) context=u:r:magisk:s0
redfin:/ # exit
```

```
PS C:\Users\p> adb reboot bootloader
PS C:\Users\p> fastboot devices
09211FDD4002F6  fastboot
PS C:\Users\p> fastboot flashing unlock
FAILED (remote: 'flashing unlock is not allowed')
fastboot: error: Command failed
PS C:\Users\p> fastboot oem unlock
FAILED (remote: 'Invalid oem command unlock')
fastboot: error: Command failed
```

Enable OEM unlock within Developer options and try again:

```
PS C:\Users\p> adb reboot bootloader
PS C:\Users\p> fastboot flashing unlock
OKAY [  0.099s]
Finished. Total time: 0.108s
PS C:\Users\p> fastboot reboot
Rebooting                                          OKAY [  0.081s]
Finished. Total time: 0.090s

```
