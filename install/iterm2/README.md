# iterm2

[post](https://cloud.tencent.com/developer/article/1822517)  
[post](https://cloud.tencent.com/developer/article/1639115)  

[website](https://iterm2.com/)  
[github](https://github.com/gnachman/iTerm2)  

```shell
# install
brew install --cask iterm2
# 打开 iterm2
# Command + 空格输入 iterm
```

## oh my zsh

[oh-my-zsh](https://ohmyz.sh/)
[oh-my-zsh github](https://github.com/ohmyzsh/ohmyzsh)  

```shell
# install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 可以在 https://github.com/ohmyzsh/ohmyzsh/wiki/themes 里面选择自己喜欢的主题，这里修改为
vim ~/.zshrc
ZSH_THEME="crcandy"

# zsh-autosuggestions 命令补全
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# 用 vim ~/.zshrc 打开文件，找到其中的插件设置，默认是 plugins=(git)，我们将其修改为

# 设置语法高亮
# brew install zsh-syntax-highlighting
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# 在末尾添加
# source /usr/local/Cellar/zsh-syntax-highlighting/0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

vim ~/.zshrc
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
```
