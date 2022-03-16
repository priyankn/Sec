## Command line 

## Setup Proxy Env variables

export https_proxy=http://127.0.0.1:8068/


## Remount Android system partition in rw 
mount -o rw,remount -t ext4 /system

ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no  -p 2222 root@127.0.0.1


ssh -o UserKnownHostsFile=/dev/null -p 2222 root@127.0.0.1

scp -o PreferredAuthentications=password -o PubkeyAuthentication=no  -P 2222 ~/Downloads/Clutch-2.0(1).4 root@127.0.0.1:/


Open https://itunes.apple.com/lookup?id=361309726 where you replace the ID with the one you looked up.

## Setting up PATH 

PATH=$PATH:~/opt/bin
PATH=~/opt/bin:$PATH

depending on whether you want to add ~/opt/bin at the end (to be searched after all other directories, in case there is a program by the same name in multiple directories) or at the beginning (to be searched before all other directories)


ssh -D 8090 -i C:\Users\user\Documents\id_rsa.txt -f -C -q -N root@10.97.255.1

## run strings on all files:
strings * > strings.txt


## Delete older than 30 days

find /path/to/files/ -type f -name '*.jpg' -mtime +30 -exec rm {} \;



## No IP on Kali VM ?

ipconfig eth0 up
dhclient eth0


## Scanning the whole network for open port then do a VisualRecon

 masscan -p80 ‪$subnet | grep on | cut -d ' ' -f6 | sed 's/^/http:\/\//g' | sed 's/$/\//g' > subdomains.txt; python /root/tools/EyeWitness/eyeWitness.py -f subdomains.txt --headless



## macOS List usB devices

ioreg -p IOUSB -l -w 0

$ security find-identity -p codesigning -v
  1) 9159205E77C210F704C626264FA6EDD194E8060E "iPhone Developer: yuzo@yourweb.email (932375LQ8Y)"
     1 valid identities found


## LINUX SHELL WITHOUT SPACES 
{chmod,+x,./nc} 


## If “Show Package Contents” do not work for a .pkg file - 

pkgutil --expand mystubbornpackage.pkg path/to/expand


—— Get IP address for VM ———— 

🍺 vmrun list
    Total running VMs: 1
    .docker/machine/machines/myvm.vmx

🍺  vmrun getGuestIPAddress ~/.docker/machine/machines/myvm.vmx
    172.16.213.128

