#!

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

# i3 config

echo "# Keyboard layout" >> /home/lucas/.config/i3/config
echo "exec setxkbmap -layout us,br -variant intl, -option grp:win_space_toggle"

echo "# i3 gaps" >> /home/lucas/.config/i3/config
echo "for_window [class="^.*"] border pixel 2" >> /home/lucas/.config/i3/config
echo "gaps inner 0" >> /home/lucas/.config/i3/config
echo "gaps outer 0" >> /home/lucas/.config/i3/config

echo "# Picom" >> /home/lucas/.config/i3/config
echo "exec_always --no-startup-id picom -C" >> /home/lucas/.config/i3/config

echo "# Wallpaper" >> /home/lucas/.config/i3/config
echo "exec --no-startup-id nitrogen --restore" >> /home/lucas/.config/i3/config

echo "# Bluez" >> /home/lucas/.config/i3/config
echo "exec --no-startup-id blueman-applet" >> /home/lucas/.config/i3/config

echo "# Keybinds" >> /home/lucas/.config/i3/config

echo "# Backlight" >> /home/lucas/.config/i3/config
echo "bindsym XF86MonBrightnessUp exec brightnessctl set +5%"
echo "bindsym XF86MonBrightnessDown exec brightnessctl set 5%-"

echo "# Media player controls" >> /home/lucas/.config/i3/config
echo "bindsym XF86AudioPlay exec playerctl play-pause"
echo "bindsym XF86AudioNext exec playerctl next"
echo "bindsym XF86AudioPrev exec playerctl previous"

echo "# Volume controls" >> /home/lucas/.config/i3/config
echo "bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status"
echo "bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status"
echo "bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status"

echo "# Screenshot" >> /home/lucas/.config/i3/config
echo "bindsym Print exec flameshot gui"

# ZSH config

echo "# Plugins" >> /home/lucas/.zshrc
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> /home/lucas/.zshrc
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> /home/lucas/.zshrc
echo "source $ZSH/oh-my-zsh.sh" >> /home/lucas/.zshrc

echo "# Aliases" >> /home/lucas/.zshrc
echo "alias dup='docker-compose up'" >> /home/lucas/.zshrc
echo "alias dupd='docker-compose up -d'" >> /home/lucas/.zshrc
echo "alias ddown='docker-compose down'" >> /home/lucas/.zshrc
echo "alias dps='docker-compose ps'" >> /home/lucas/.zshrc
echo "alias dbuild='docker-compose build'" >> /home/lucas/.zshrc

# Git config

git config --global user.email "lucascbittencourt1@gmail.com"
git config --global user.name "Lucas Bittencourt"
git config --global pull.rebase false
git config --global defaultbranch main
git config --global color.ui true
git config --global core.editor vim
