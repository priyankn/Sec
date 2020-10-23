All of a sudden facing this issue on OS X (Catalina):

```
$frida
-bash: /usr/local/bin/frida: /usr/local/opt/python/bin/python3.7: bad interpreter: No such file or directory

```

Why?

After an hour of installing/reinstalling/fixing paths and what not, the solution is to do with linking and then using pip3 to install frida and frida-tools (in my case only the later) - 


```
ln -s /usr/local/bin/python3 /usr/local/opt/python/bin/python3.7
```

```
$frida
Traceback (most recent call last):
  File "/usr/local/bin/frida", line 6, in <module>
    from frida_tools.repl import main
ModuleNotFoundError: No module named 'frida_tools'
$ pip3 install frida-tools

..blah blah..
Successfully built frida-tools

$frida
Usage: frida [options] target

//Works now
```
