# revert

git revert 指令会撤回某次提交（commit）。这个指令触发的代码回退并不会真正地删除掉代码提交历史，而是将撤回操作作为新的一次提交记录。

```shell
# 撤回上一个版本的提交
git revert HEAD^
# 回退到上上个版本
git revert HEAD^^
git revert HEAD^2
# 回退到具体某个版本的提交
git revert 版本ID
```
