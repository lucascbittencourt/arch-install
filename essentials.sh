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

# Root Password
echo "Root password:"
passwd

# Pacman.conf
sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 10/' /etc/pacman.conf
sed -i 's/^#Color = 5/Color/' /etc/pacman.conf

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
    sof-firmware \
    nss-mdns \
    acpid \
    ntfs-3g 

# GRUB
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Enable Services
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable acpid

# User
useradd -m -s /bin/zsh lucas
passwd lucas
echo "lucas ALL=(ALL) ALL" >> /etc/sudoers.d/lucas

echo "All done!" 
