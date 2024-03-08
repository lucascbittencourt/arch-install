#! /bin/sh

# Clock
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

# Localization
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=us-acentos" > /etc/vconsole.conf

# Network
echo "arch" > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts

# Install packages

pacman -S \
    grub \
    xorg \
    xorg-server \
    xorg-drivers \
    mesa \
    libgl \
    efibootmgr \
    networkmanager \
    network-manager-applet \
    dialog \
    wpa_supplicant \
    mtools \
    dosfstools \
    reflector \
    base-devel \
    linux-lts-headers \
    avahi \
    xdg-user-dirs \
    xdg-utils \
    gvfs \
    gvfs-smb \
    nfs-utils \
    inetutils \
    dnsutils \
    bridge-utils \
    dnsmasq \
    openbsd-netcat \
    iptables-nft \
    ipset \
    firewalld \
    bluez \
    bluez-utils \
    cups \
    hplip \
    alsa-utils \
    pulseaudio \
    pulseaudio-alsa \
    pavucontrol \
    bash-completion \
    openssh \
    rsync \
    acpi \
    acpi_call \
    tlp \
    acpid \
    ntfs-3g \
    ly \
    i3 \
    i3status \
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
    sudo \
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

# GRUB
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Enable Services
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable acpid
systemctl enable ly
systemctl enable docker.service

# User
useradd -m -s /bin/zsh lucas
passwd lucas
echo "lucas ALL=(ALL) ALL" >> /etc/sudoers

# Add user to groups

usermod -aG docker lucas

echo "All done!" 
