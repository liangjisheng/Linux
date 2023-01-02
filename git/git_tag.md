# git tag

```shell
# 创建轻量标签
# 基于本地当前分支的最后的一个commit 创建的 tag
git tag <tagName>
# 指定 commit 打 tag
git tag -a <tagName> <commitId>

# 创建附注标签
git tag -a 标签名称 -m 附注信息
git tag -a 标签名称 提交版本号 -m 附注信息

# 推送 tag 到 remote
git push origin <tagName>
# push all tag
git push origin --tags
# 查看 commit log
git log --pretty=oneline

# 查看本地某个 tag 的详细信息
git show <tagName>
# 查看本地所有 tag
git tag
git tag -l
# 查看远程所有 tag
git ls-remote --tags origin
# 本地 tag 的删除
git tag -d <tagName>
# 远程 tag 的删除
git push origin :refs/tags/<tagName>
git push origin --delete 标签名称

# checkout 某个 tag
git checkout -b 分支名称 标签名称
```
