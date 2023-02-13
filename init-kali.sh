#!/bin/bash

echo "========== Set Shell =========="

if zsh --version | grep "zsh " > /dev/null
then
	echo "Exist zsh"
	echo "========== Install Oh-my-zsh =========="
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	echo "Edit .zshrc"

	echo "# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '\$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/.bash_aliases
PROMPT=\"%F{46}┌──[LQ🚀%F{201}\$(ip -4 addr | grep -v '127.0.0.1' | grep -v 'secondary' | grep -Po \"inet \\K[\\d.]+\" | sed -z \"s/\\n/|/g;s/|$/\\n/\")⚔%n%F{46}]\"$'\\n'\"└──╼[👾]%F{44}%~ ->%f \"
precmd() { eval \"\$PROMPT_COMMAND\" }
export PROMPT_COMMAND='source ~/.zshrc'" > $HOME/.zshrc

	echo "Edit .bash_aliases"

	echo "alias ll='ls -al'
alias ..='cd ../'
alias ....='cd ../../'" > $HOME/.bash_aliases

	echo "Set Default Shell is Zsh"
	echo `sudo chsh -s /bin/zsh`
else
	echo "No exist zsh\nPlease Install Zsh"
fi

echo "========== Set sources.list =========="
# YES = "y"
read -p "Is kali?(y/n):" REPLY

if [ $REPLY == "y" ] 
then


echo "# See https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/
# deb http://http.kali.org/kali kali-rolling main contrib non-free

# Additional line for source packages
# deb-src http://http.kali.org/kali kali-rolling main contrib non-free

#清华大学

deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free

deb-src https://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free

#阿里云

deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib

deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib

#中科大

deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib

deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib

#浙大

deb http://mirrors.zju.edu.cn/kali kali-rolling main contrib non-free

deb-src http://mirrors.zju.edu.cn/kali kali-rolling main contrib non-free

#东软大学

deb http://mirrors.neusoft.edu.cn/kali kali-rolling/main non-free contrib

deb-src http://mirrors.neusoft.edu.cn/kali kali-rolling/main non-free contrib

# See https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/

deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list

else 
	echo "No kali ,Unable to set!"
fi

echo "========== Set gnome shortcut keys =========="

