# hook

[githooks](https://git-scm.com/docs/githooks)

执行一些 git 操作前后, 另外执行一些操作
git hooks 分为客户端和服务端
使用默认的 hook 目录, 使用时需要去除文件.sample后缀名，否则文件不生效
且 hook 文件要具有可执行权限, 可使用 bash shell/Ruby/Python 等脚本编写

配置自定义 hook 目录

```shell
git config core.hooksPath .githooks
```

常用 hook 为 pre-commit, commit-msg, 是在 git commit 执行前调用, 可用下面的命令绕过

```shell
git commit --no-verify
```
