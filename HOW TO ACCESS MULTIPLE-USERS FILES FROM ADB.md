

### How To Access Multiple-Users Files from ADB


With root accesss - 

```
# pm list users
Users:
        UserInfo{0:Owner:c13} running
        UserInfo{10:Work profile:1030} running
```


* External storage at `/data/media/{user Id}`
* Internal app storage at `/data/user/{user Id}`


Device Configuration - 

* Android 11 - Google Pixel 5  
* Systemless root via Magisk
* [Probably Optional - Need to Check] `/system` in rw mode via this [Universal Mount System RW](https://forum.xda-developers.com/t/closed-script-android-10-universal-mount-systemrw-superrw-featuring-makerw-read-write.4247311/)
(Restore and re-setup AWP and try it out)


Additional References 

* [How to access /storage/emulated/10](https://android.stackexchange.com/questions/221122/how-to-access-storage-emulated-10-multi-users-env-in-adb-shell-on-android-9)
* [Android External Storage Space](https://blog.fearcat.in/a?ID=01800-492b983d-a881-42d1-b745-d930d280f9bc)


Many devices now divide permanent storage space into separate "internal" and "external" partitions. Therefore, even if there is no removable storage medium, these two storage spaces always exist, and the API behavior of the two storage spaces is the same regardless of whether the external storage space is removable. In the current Adnroid system, the external storage space is actually re-mounted to the internal data directory "/data/media" through Linux Mount and Bind Mount.
