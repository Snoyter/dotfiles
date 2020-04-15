#!/bin/bash
loadkeys ru
setfont cyr-sun16

#iwconfig
#read -p "Имя интерфейса" wifi
#wifi-menu wifi

timedatectl set-ntp true
timedatectl set-timezone Asia/Novosibirsk

(
  echo o;

  echo n;
  echo;
  echo;
  echo;
  echo +100M;

  echo n;
  echo;
  echo;
  echo;
  echo +20G;

  echo n;
  echo;
  echo;
  echo;
  echo +1024M;

  echo n;
  echo p;
  echo;
  echo;
  echo a;
  echo 1;

  echo w;
) | fdisk /dev/sda
fdisk -l

mkfs.ext2 /dev/sda1 -L boot
mkfs.ext4 /dev/sda2 -L root
mkswap /dev/sda3 -L swap
mkfs.ext4 /dev/sda4 -L home

mount /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
swapon /dev/sda3
mount /dev/sda4 /mnt/home


pacman -Sy reflector --noconfirm
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "RU" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

pacstrap /mnt base  --noconfirm 

#base-devel linux linux-firmware neovim netctl

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen 
locale-gen

echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf

echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf

echo "navi" > /etc/hostname
echo '127.0.0.1	localhost' > /etc/hosts
echo '::1		localhost' >> /etc/hosts
echo '127.0.1.1	navi.localdomain navi' >> /etc/hosts

mkinitcpio -p linux

passwd

#The end of the main tasks

pacman -S grub --noconfirm 
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

pacman -S dialog wpa_supplicant --noconfirm 

useradd -m -g users -G wheel -s /bin/bash snoyter

echo 'Пароль для пользователя'

passwd snoyter

echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

pacman -S xorg-server xorg-drivers xorg-xinit --noconfirm 
pacman -S ttf-hack --noconfirm 
pacman -S networkmanager network-manager-applet ppp --noconfirm

systemctl enable NetworkManager

# >> Установка программ

pacman -S i3-wm ranger

exit
reboot
#conky htop git pulseaudio picom mplayer 
#git clone https://github.com/snoyter/dotfiles
#cp -r dotfiles/.config ~

#su
#cp dotfiles/programms/st/st /bin
#cp dotfiles/programms/dmenu/dmenu /bin
#exit 

#cp dotfiles/.b* ~
#cp dotfiles/.xinitrc ~ 
#cp dotfiles/.gitconfig

#echo "[Service]" > /etc/systemd/system/getty@tty1.service.d/override.conf
#echo "ExecStart=" >> /etc/systemd/system/getty@tty1.service.d/override.conf
#echo "ExecStart=-/usr/bin/agetty --autologin snoyter --noclear %I $TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf
