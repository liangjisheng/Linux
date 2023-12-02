# Makefile

## phony

make xxx.   是否执行xxx 这个 target 对应的规则。 取决于这个 target 是否存在， 以及生成这个 target 的input files 是否发生改变  
但是如果想 make xxx 时, 总是执行则加上 .PHONY

```makefile
.PHONY: xxx
 
xxx:
    some commands
```

理论依据是在Makefile中，.PHONY后面的target表示的也是一个伪造的target, 而不是真实存在的文件target，注意Makefile的target默认是文件  
这样的话 .PHONY: target 此 target 不当做 file 对待，所以就不用关心 target 这个 file 是否存在。而always 执行对应的规则
