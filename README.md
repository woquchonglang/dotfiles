# welcome to my install.sh, this is the .sh about my Ubuntu22.4 config on bspwm, and the kernal is 6.8.0.40.

sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt upgrade

# basic tool
sudo apt install git inxi cmake make gcc g++ ninja npm bluez blueman gettext curl wget libgtk-3-dev gir1.2-dbusmenu-glib-0.4 libdbusmenu-glib-dev libdbusmenu-gtk3-4 libdbusmenu-gtk3-dev python3-venv mpd ncmpcpp


# bspwm
sudo apt install bspwm sxhkd cargo rofi fcitx5 kitty polybar dunst  nitrogen htop dmenu wget thefuck
libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson

# picom
cd ~/apps/
git clone https://github.com/yaocccc/picom.git
cd picom
git submodule update --init --recursive
meson setup --buildtype=release . build
ninja -C build
sudo ninja -C build install

# terminal
sudo apt install kitty fcitx5 ranger 

## fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ~/.fzf/install


## zsh
sudo apt install zsh

## ohmyzsh
sh -c "$(wget -O- https://install.ohmyz.sh/)"

## zsh plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## neovim
git clone https://github.com/neovim/neovim.git
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ~/Document
git clone https://github.com/woquchonglang/dotfiles.git
cd dotfiles
cp -r nvim ~/.config/nvim

## nvim theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

## neovide
https://github.com/neovide/neovide/releases/latest/download/neovide.AppImage
mv neovide.AppImage ~/user/apps

## fastfetch
https://github.com/fastfetch-cli/fastfetch/releases/download/2.23.0/fastfetch-linux-amd64.deb
cd ~/Downloads
sudo apt install ./fastfetch-linux-amd64.deb


# app

## lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

## fcitx
sudo apt install sogopinyin

## store

cd ~/Downloads
sudo apt install ./spark-store*.deb

yes

## music
sudo apt install golang
sudo aptss install go-musicfox

## media
sudo apt install feh vlc 

## .md
sudo snap install glow

## obs
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install ffmpeg obs-studio
sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0
sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=0

