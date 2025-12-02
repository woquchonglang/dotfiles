# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    z
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos

# pokemon-colorscripts
# pokemon-colorscripts --no-title -s -r

# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias neovim='/usr/bin/nvim'
alias nvim='neovide'
alias hyprland=Hyprland

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

proxy(){
	export http_proxy="http://127.0.0.1:7890"
	export https_proxy="http://127.0.0.1:7890"
	# echo "proxy on"
}
noproxy(){
	unset http_proxy
	unset https_proxy
	echo "proxy off"
}

export PATH="$PATH:/home/yjy/Documents/apps/nvim/bin"
export PATH="$PATH:/home/yjy/apps/clangd/bin"
export PATH="$PATH:/home/yjy/apps/arm-gnu-toochain/bin"
export XDG_CONFIG_HOME="$HOME/.config"

ros2_on(){
  export ROS_DOMAIN_ID=42
  export ROS_VERSION=2
  export ROS_PYTHON_VERSION=3
  export ROS_DISTRO=humble
  source /opt/ros/humble/setup.zsh
}


# Created by `pipx` on 2024-08-24 12:35:05
export PATH="$PATH:/home/yjy/.local/bin"

#fuck
eval $(thefuck --alias FUCK)

eval $(thefuck --alias)

#proxy
proxy
