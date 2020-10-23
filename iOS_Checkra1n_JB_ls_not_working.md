iOS device - 12.4 , Jailbroken with checkra1n - 

SSH in, and find out the ls doesnt really work. 

```
root# ls
ls: illegal option -- -
usage: ls [-ABCFGHLOPRSTUWabcdefghiklmnopqrstuwx1] [file ...]
```

Googled around, and found about the common alias on OS X systems (https://github.com/sorin-ionescu/prezto/issues/966#issuecomment-172003005) 
Basically involved correcting the PATH env variable.

Updated the coreutils via Cydia, etc, but same issue.

Found out shell is zsh - 

```
#zsh --version
zsh 5.7.1 (aarch64-apple-darwin17)
```

Why are we using zsh? Lets try bash - Works! 

```
root# /bin/bash
%m%::%~ %n%# 
%m%::%~ %n%# 
%m%::%~ %n%# ls -l
total 32
-rw-r--r--   1 root  wheel    1 Apr  1  2019 .aks_migrate
-rw-r--r--   1 root  wheel    1 Apr  1  2019 .aks_whitelist
-rw-------   1 root  wheel  991 Oct 22 12:08 .bash_history
-rw-r--r--   1 root  wheel    0 Aug  9  2018 .bootstrapped
-rw-r--r--   1 root  wheel   72 Oct 19 15:16 .mkb_seshat_health
```


Try simple things first! :) 
