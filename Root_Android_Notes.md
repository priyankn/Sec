
Recover stock images.
Fetch at https://developers.google.com/android/images 

### Recover Nexus 5X  (Optional)

```
MBP-BF:bullhead-opm7.181205.001 $ adb reboot-bootloader
MBP-BF:bullhead-opm7.181205.001 $ ./flash-all.sh 
Sending 'bootloader' (4610 KB)                     OKAY [  0.226s]
Writing 'bootloader'                               OKAY [  0.193s]
Finished. Total time: 0.460s
Rebooting into bootloader                          OKAY [  0.003s]
Finished. Total time: 0.003s
Sending 'radio' (56630 KB)                         OKAY [  1.749s]
Writing 'radio'                                    OKAY [  1.025s]
Finished. Total time: 2.820s
Rebooting into bootloader                          OKAY [  0.008s]
Finished. Total time: 0.008s
--------------------------------------------
Bootloader Version...: [REDACTED]
Baseband Version.....: [REDACTED]
Serial Number........:  [REDACTED]
--------------------------------------------
extracting android-info.txt (0 MB) to RAM...
Checking 'product'                                 OKAY [  0.019s]
Checking 'version-bootloader'                      OKAY [  0.020s]
Checking 'version-baseband'                        OKAY [  0.020s]
extracting boot.img (11 MB) to disk... took 0.067s
archive does not contain 'boot.sig'
Sending 'boot' (11781 KB)                          OKAY [  0.340s]
Writing 'boot'                                     OKAY [  0.225s]
archive does not contain 'dtbo.img'
archive does not contain 'dt.img'
archive does not contain 'pvmfw.img'
extracting recovery.img (17 MB) to disk... took 0.077s
archive does not contain 'recovery.sig'
Sending 'recovery' (17425 KB)                      OKAY [  0.481s]
Writing 'recovery'                                 OKAY [  0.347s]
archive does not contain 'vbmeta.img'
archive does not contain 'vbmeta_system.img'
archive does not contain 'vendor_boot.img'
archive does not contain 'super_empty.img'
archive does not contain 'odm.img'
archive does not contain 'odm_dlkm.img'
archive does not contain 'product.img'
extracting system.img (1909 MB) to disk... took 16.707s
archive does not contain 'system.sig'
Sending sparse 'system' 1/4 (508768 KB)            OKAY [ 19.329s]
Writing 'system'                                   OKAY [ 10.126s]
Sending sparse 'system' 2/4 (524238 KB)            OKAY [ 27.415s]
Writing 'system'                                   OKAY [ 10.214s]
Sending sparse 'system' 3/4 (501061 KB)            OKAY [ 28.634s]
Writing 'system'                                   OKAY [ 10.495s]
Sending sparse 'system' 4/4 (421469 KB)            OKAY [ 19.470s]
Writing 'system'                                   OKAY [  8.133s]
archive does not contain 'system_ext.img'
extracting vendor.img (185 MB) to disk... took 4.141s
archive does not contain 'vendor.sig'
Sending 'vendor' (190332 KB)                       OKAY [  4.329s]
Writing 'vendor'                                   OKAY [  4.187s]
archive does not contain 'vendor_dlkm.img'
Erasing 'userdata'                                 OKAY [  0.557s]
mke2fs 1.45.4 (23-Sep-2019)
Creating filesystem with 2874363 4k blocks and 719488 inodes
Filesystem UUID: c1c20817-d09e-4616-a661-a91a485147eb
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done 

Sending 'userdata' (4284 KB)                       OKAY [  0.199s]
Writing 'userdata'                                 OKAY [  0.110s]
Erasing 'cache'                                    OKAY [  0.073s]
mke2fs 1.45.4 (23-Sep-2019)
Creating filesystem with 24576 4k blocks and 24576 inodes

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: done

Sending 'cache' (92 KB)                            OKAY [  0.080s]
Writing 'cache'                                    OKAY [  0.018s]
Rebooting                                          OKAY [  0.020s]
Finished. Total time: 167.736s
```

### Install Magisk Manager App 

```
adb install ~/Downloads/Magisk-v23.0.apk 
Performing Streamed Install
Success
```

### Copy the stock boot image onto sdcard and patch the image using Magisk 

```
adb push image-bullhead-opm7.181205.001/boot.img /sdcard
image-bullhead-opm7.181205.001/boot.img: 1 file pushed, 0 skipped. 23.0 MB/s (12063974 bytes in 0.500s)
```

### Copy back the patched image and flash it as boot

```
$ adb pull /sdcard/Download/magisk_patched-23000_AITw9.img .
/sdcard/Download/magisk_patched-23000_AITw9.img: 1 file pulled, 0 skipped. 21.4 MB/s (12383528 bytes in 0.553s)
$ fastboot flash boot magisk_patched-23000_AITw9.img 
Sending 'boot' (12093 KB)                          OKAY [  0.332s]
Writing 'boot'                                     OKAY [  0.229s]
Finished. Total time: 0.623s
```



