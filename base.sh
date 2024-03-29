#! /bin/sh

# Pacman packages

sudo pacman -S \
    i3 \
    dmenu \
    rofi \
    nitrogen \
    picom \
    lxappearance \
    docker \
    docker-compose \
    zsh \
    zsh-completions \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    arandr \
    flameshot \
    libreoffice \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    noto-fonts-extra \
    ttf-ubuntu-font-family \
    xfce4-terminal \
    brightnessctl \
    arc-gtk-theme \
    archlinux-wallpaper 

sudo systemctl enable docker.service

usermod -aG docker lucas

# Display manager 
git clone https://aur.archlinux.org/ly
cd ly
makepkg -si
cd
sudo systemctl enable ly.service

# Yay install

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Yay packages

yay -S --noconfirm \
    google-chrome \
    discord \
    vlc \
    spotify \
    whatsapp-nativefier \
    tuxedo-drivers-dkms \
    networkmanager-dmenu-git \
    ttf-material-icons-git \
    phpstorm \
    visual-studio-code-bin \
    insomnia \
    postman \
    oh-my-zsh-git
