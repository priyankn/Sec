
## Install Burp cert on Android 10+ 


If `dm-verity` is enabled on Android 10+, and you have a user build i.e. it cannot be disabled 

You can't mount `/system` in android 10+ without disabling dm-verity. You can still however mount a tempfs on `/system/etc/security/cacerts` to make this work temporarily (i.e. until you reboot). Your device still needs to be rooted to make this work.

```
$ adb shell
$ su
# whoami
root
```

### Create a separate temp directory, to hold the current certificates 

`mkdir -m 700 /wherever/you/want
`

### Copy the existing certificates

`cp /system/etc/security/cacerts/* /wherever/you/want/
`

### Create an in-memory mount

`mount -t tmpfs tmpfs /system/etc/security/cacerts
`

### Copy the existing certs back into the tmpfs mount

`mv /whereever/you/want/* /system/etc/security/cacerts/
`

### Copy the new certificate, the cert file should be named in the hash.0 format (See below to convert PEM to hash)

`mv /path/to/cert/hash.0 /system/etc/security/cacerts/
`

### Update the perms & selinux context labels, so everything is as readable as before

```
chown root:root /system/etc/security/cacerts/*
chmod 644 /system/etc/security/cacerts/*
chcon u:object_r:system_file:s0 /system/etc/security/cacerts/*
```

### Enjoy until next reboot! 

-----------------------------------------------------------------------------------------------


## Install Burp cert on Android 7-10 

### Convert to PEM and get the hash

```
openssl x509 -inform DER -in Burp.cer -out Burp.pem
openssl x509 -inform PEM -subject_hash_old -in Burp.pem |head -1
9a5ba575
```

### Move to device

```
$ mv Burp.pem 9a5ba575.0
$ adb push 9a5ba575.0 /sdcard
9a5ba575.0: 1 file pushed. 0.1 MB/s (1375 bytes in 0.026s)
```

### Set selinux to permissive in order to mount the /system as permissive

```bullhead:/ # getenforce
Enforcing
bullhead:/ # setenforce 0
bullhead:/ # getenforce                                                                                                                                               
Permissive
```

### Remount in RW

```
bullhead:/ # mount -o rw,remount,rw /
bullhead:/ # rm /system/etc/security/cacerts/9576d26b.0                                                                                                             

```

#### Check if it actually remounted, if it did not, rm would not be allowed. Else the steps will have to be repeated.

```
rm ro /system/etc/security/cacerts/9576d26b.0 (y/N):y
rm: /system/etc/security/cacerts/9576d26b.0: Read-only file system
```

### Copy and reboot

```
bullhead:/ # ls -lrt /system/etc/security/cacerts/9a*
-rw-rw---- 1 root sdcard_rw 1375 2020-06-04 10:20 /system/etc/security/cacerts/9a5ba575.0
bullhead:/ # rm /system/etc/security/cacerts/9a5ba575.0
bullhead:/ # ls -lrt /system/etc/security/cacerts/9a*                                                                                                                 
ls: /system/etc/security/cacerts/9a*: No such file or directory
1|bullhead:/ # mv /sdcard/9a5ba575.0 /system/etc/security/cacerts/                                                                                                    
bullhead:/ # ls -lrt /system/etc/security/cacerts/9a*                                                                                                                 
-rw-rw---- 1 root sdcard_rw 1375 2020-06-04 10:55 /system/etc/security/cacerts/9a5ba575.0
bullhead:/ # chmod 644 /system/etc/security/cacerts/9a5ba575.0
bullhead:/ # ls -lrt /system/etc/security/cacerts/9a*                                                                                                                 
-rw-r--r-- 1 root sdcard_rw 1375 2020-06-04 10:55 /system/etc/security/cacerts/9a5ba575.0
bullhead:/ # reboot
```

P.S - the adb root command wasn't working (adbd cannot run as root in production builds) so had to append ro.debuggable=1 to some files (as advised [here](https://stackoverflow.com/questions/25477424/adb-shell-su-works-but-adb-root-does-not) ) 
These changes should not affect the above steps because I worked on the root shell.  Or Maybe it did because I did get this once:
```
1|bullhead:/ $ mount -o rw,remount /system
mount: '/dev/block/platform/soc.0/f9824900.sdhci/by-name/system' not user mountable in fstab
```

#### References 
- [HttpToolKit](https://httptoolkit.tech/docs/guides/android/#adb-interception)
- [HTTPToolkit Script](https://github.com/httptoolkit/httptoolkit-server/blob/master/src/interceptors/android/adb-commands.ts#L206)



