### To find out where the bundle container is located

`ObjC.classes.NSBundle.mainBundle().bundlePath().toString();`

### To find out where the data container is located

`ObjC.classes.NSProcessInfo.processInfo().environment().objectForKey_("HOME").toString();`



#### **Files.app is weird, I had to grep it to find the path, but here's what I found on iOS 15.7.6

`/private/var/mobile/Containers/Shared/AppGroup/[Random ID]/File Provider Storage/YOLO`
