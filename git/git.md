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

# 修改当前分支名为 main
git branch -M main

# 修改最近一次提交信息
git commit --amend

git config --list
# 配置用户名
git config --global user.name "John Doe"
# 配置邮箱
git config --global user.email johndoe@example.com
# 设置初始分支名为 main
git config --global init.defaultBranch main

# 添加 / 删除配置项
git config --local -–add site.name y
git config --local -–unset site.name

git config --global LANG=en_GB

# 查看 git log
git log --oneline -5

# 撤销所有文件的修改
git checkout .
# 强制更新代码
git push -f origin feat/referral
# 取消 merge
git merge --abort
```

回退代码的2中方式 [revert](./revert.md) 和 [reset](./reset.md)

## 本地初始化 git 仓库

```shell
git init
git config user.name liangjisheng
git config user.email liangjisheng@example.com
git add --all
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:liangjisheng/repo.git
git push -u origin main
```

git 显示中英文切换

```shell
# linux
echo "alias git='LANG=en_GB git'" >> ~/.bashrc
echo "alias git='LANG=zh_CN git'" >> ~/.bashrc
source ~/.bashrc

# mac
echo "alias git='LANG=en_GB git'" >> ~/.zsh_aliases
echo "alias git='LANG=zh_CN git'" >> ~/.zsh_aliases
source ~/.zshrc
```
