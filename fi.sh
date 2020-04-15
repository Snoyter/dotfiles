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