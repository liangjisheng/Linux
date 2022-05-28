# git

git 常用命令

```shell
# 删除远程分支
git push origin --delete add-router

# 查看本地分支和追踪情况
git remote show origin

# 删除本地远程分支中远程仓库并没有的分支
git remote prune origin

# 删除本地多余分支
git branch -D feature/chatfix

# 修改最近一次提交信息
git commit --amend

# 配置用户名
git config --global user.name "John Doe"
# 配置邮箱
git config --global user.email johndoe@example.com

# 查看 git log
git log --oneline -5
```

本地初始化 git 仓库

```shell
git init
git remote add origin https://gitee.com/kotlindev/test1.git
```

回退代码的2中方式 [revert](./revert.md) 和 [reset](./reset.md)