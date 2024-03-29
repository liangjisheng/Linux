# gitattributes

.gitattributes 是一个文本文件，文件中的一行定义一个路径的若干个属性，主要用于定义每种文件的属性，以方便 git 帮我们统一管理

在.gitattributes文件的一行中，一个属性（以text属性为例）可能有4种状态：

设置text
不设置-text
设置值text=string
未声明，通常不出现该属性即可；但是为了覆盖其他文件中的声明，也可以!text

```conf
*           text=auto  
# 文件的行尾自动转换。如果是文本文件，则在文件入Git库时，行尾自动转换为LF。如果已经在入Git库中的文件的行尾是GRLF，则文件在入Git库时，不再转换为LF。

*.txt       text  
# 对于.txt文件，标记为文本文件，并进行行尾规范化。

*.jpg       -text  
# 对于`.jpg`文件，标记为非文本文件

*.vcproj    text eol=crlf 
# 对于.vcproj文件，标记为文本文件，在文件入Git库时进行规范化，行尾转换为LF。在检测到出工作目录时，行尾自动转换为GRLF。

*.sh        text eol=lf  
# 对于sh文件，标记为文本文件，在文件入Git库时进行规范化，即行尾为LF。在检出到工作目录时，行尾也不会转换为CRLF（即保持LF）。

*.py        eol=lf  
# 对于py文件，只针对工作目录中的文件，行尾为LF。
```
