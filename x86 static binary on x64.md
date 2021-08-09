## Install libc 

```
 sudo apt-get install lib32stdc++6
 sudo apt-get install libstdc++6
 sudo apt-get install libc6-i386
 ```
 
 ## Check via ldd 
 
 ```
 ldd binary_name
	linux-gate.so.1 (0xf7fc8000)
	libbluetooth.so.3 => not found
	libstdc++.so.6 => not found
	libpthread.so.0 => /lib32/libpthread.so.0 (0xf7f54000)
	libc.so.6 => /lib32/libc.so.6 (0xf7d69000)
	/lib/ld-linux.so.2 (0xf7fca000)
 ```
 
 ## Export the libc location 
 
 ```
 export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/
 sudo ldconfig
 ```
 
 ## Verify arch is added
 
 ```
ubuntu@ubuntu:~/tools$ sudo dpkg --add-architecture i386
ubuntu@ubuntu:~/tools$ dpkg --print-architecture
amd64
ubuntu@ubuntu:~/tools$ 
ubuntu@ubuntu:~/tools$ dpkg --print-foreign-architectures
i386

```
