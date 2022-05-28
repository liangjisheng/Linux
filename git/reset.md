# reset

git reset指令的作用是重置HEAD的位置，将代码重置到某个版本。即将HEAD指向的位置改变为之前存在的某个版本，而后面的提交记录会被删除。

git reset [--soft | --mixed | --hard] [HEAD]

--mixed 为默认，可以不用带该参数，用于重置版本库中的文件与某一次的提交(commit)保持一致，工作区文件内容保持不变, 将版本库的代码重置到某个版本，将重置的更改留在工作区中

```shell
# 重置当前版本，即撤回 git add 操作
git reset HEAD
# 重置所有内容到上一个版本
git reset HEAD^
# 重置 hello.php 文件的版本到上一个版本
git reset HEAD^ hello.php
# 重置到指定版本
git reset 052eab65
```

--soft 参数用于重置到某个版本, 将版本库的代码重置到某个版本，将重置的更改保存在暂存区

```shell
# 重置上上个版本
git reset --soft HEAD^2
```

--hard 将版本库的代码重置到某个版本，删除变更的记录，一无所有

```shell
# 重置上上上一个版本
git reset –hard HEAD^3
# 重置到某个版本
git reset –hard bae128d6
# 将本地版本的状态重置到和远程的一样
git reset --hard origin/master
```
