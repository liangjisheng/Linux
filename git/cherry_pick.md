# cherry pick

[cherry-pick](http://www.ruanyifeng.com/blog/2020/04/git-cherry-pick.html)

git cherry-pick 命令的作用，就是将指定的提交（commit）应用于其他分支

```shell
git cherry-pick commitHash
```

上面命令就会将指定的提交commitHash，应用于当前分支。这会在当前分支产生一个新的提交，当然它们的哈希值会不一样

```shell
git cherry-pick 051fd0775cec1e4a336cc3c6fd49208685750596
```

git cherry-pick命令的参数，不一定是提交的哈希值，分支名也是可以的，表示转移该分支的最新提交

```shell
git cherry-pick branch1
```

Cherry pick 支持一次转移多个提交

```shell
git cherry-pick HashA HashB
```

上面的命令将 A 和 B 两个提交应用到当前分支。这会在当前分支生成两个对应的新提交。

如果想要转移一系列的连续提交，可以使用下面的简便语法

```shell
git cherry-pick A..B
```

上面的命令可以转移从 A 到 B 的所有提交。它们必须按照正确的顺序放置：提交 A 必须早于提交 B，否则命令将失败，但不会报错。

注意，使用上面的命令，提交 A 将不会包含在 Cherry pick 中。如果要包含提交 A，可以使用下面的语法

```shell
git cherry-pick A^..B
```
