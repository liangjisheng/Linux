# brew

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
