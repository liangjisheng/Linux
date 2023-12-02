# brew

Homebrew 主要有四个部分组成: brew、homebrew-core 、homebrew-bottles、homebrew-cask
brew: Homebrew 源代码仓库
homebrew-core: Homebrew 核心软件仓库
homebrew-bottles: Homebrew 预编译二进制软件包
homebrew-cask: 提供 macOS 应用和大型二进制文件

Homebrew 的两个术语
Formulae: 软件包，包括了这个软件的依赖、源码位置及编译方法等；
Casks: 已经编译好的应用包，如图形界面程序等。

```shell
brew -v
brew update
brew list
brew list --versions
brew search xxx
brew info <packageName>
brew install xxx
brew uninstall xxx
brew cask install xxx
brew cask uninstall xxx
# 列出 Homebrew cask 可安装的所有软件
brew search --casks
```

```shell
# 清理所有包的旧版本
brew cleanup 
# 清理指定包的旧版本
brew cleanup [包名]
# 查看可清理的旧版本包，不执行实际操作
brew cleanup -n 
```

启动web服务器
可以通过浏览器访问 [localhost](http://localhost:4567/) 来同网页来管理包

```shell
brew server
```

卸载 Homebrew

```shell
cd `brew --prefix`
rm -rf Cellar
brew prune
rm `git ls-files`
rm -r Library/Homebrew Library/Aliases Library/Formula Library/Contributions
rm -rf .git
rm -rf ~/Library/Caches/Homebrew
```

brew install 是下载源码解压，然后 ./configure && make install ，同时会包含相关依存库，并自动配置好各种环境变量

brew cask install 是针对已经编译好了的应用包（.dmg/.pkg）下载解压，然后放在统一的目录中（Caskroom），省掉了自己下载、解压、安装等步骤。

brew install 用来安装一些不带界面的命令行工具和第三方库。
brew cask install 用来安装一些带界面的应用软件。

当 wget 出现这个问题后可以卸载后重新安装
dyld: Library not loaded: /usr/local/opt/libunistring/lib/libunistring.2.dylib

```shell
brew uninstall -f wget
brew install wget
```

[brew 切换源](https://juejin.cn/post/7221089899280384059)

brew 替换为中科大源

```shell
# 替换各个源
$ git -C "$(brew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git
$ git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
$ git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git

# zsh 替换 brew bintray 镜像
$ echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
$ source ~/.zshrc

# bash 替换 brew bintray 镜像
$ echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile
$ source ~/.bash_profile

# 刷新源
$ brew update
```

```shell
$ cd "$(brew --repo)" && git remote -v

$ git config --global --add safe.directory /usr/local/Homebrew
$ git config --global --add safe.directory /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core
$ git config --global --add safe.directory /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask

# 刷新源
$ brew update
```
