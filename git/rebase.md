# rebase

压缩合并多次提交
-i 的意思是 –interactive, 即弹出交互式的界面让用户编辑完成合并操作

```shell
git rebase -i [startpoint] [endpoint]
```

合并从当前 head 到 15f745b (commit id)

```shell
git rebase -i 15f745b
```

合并最近的两次提交

```shell
git rebase -i HEAD~2
```

将第二行的 pick 改为 s, squash 的意思是将这个提交压缩为最后一次提交
