# describe

使用 git 产生版本号

如果符合条件的 tag 指向最新提交则只是显示 tag 的名字
否则会有相关的后缀来描述该 tag 之后有多少次提交以及最新的提交 commit id
不加任何参数的情况下，git describe 只会列出带有注释的 tag

```shell
$ git describe
v1.0.3-6-g0c2b1cf
```

6: 表示自打 tag v1.0.3 以来有 6 次提交 (commit)
g0c2b1cf: g 为git的缩写，在多种管理工具并存的环境中很有用处
0c2b1cf: 7 位字符表示为最新提交的 commit id 前7位

```shell
$ git describe --tags --always --dirty="-dev"
v1.0.3-6-g0c2b1cf-dev
```

如果当前版本已经有tag则直接输出此 tag 名: v1.0.3
如果不是，则输出 v1.0.3-6-g0c2b1cf, 含义如上面所述
如果本地仓库有修改，则认为是 dirty 的，则追加 -dev，表示是开发版: v1.0.3-6-g0c2b1cf-dev
