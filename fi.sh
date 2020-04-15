# >> Установка системы
loadkeys ru
setfont cyr-sun16

timedatectl set-ntp true

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
  echo +8G;

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


mkfs.ext2 /dev/sda1 -L boot
mkfs.ext4 /dev/sda2 -L root
mkswap /dev/sda3 -L swap
mkfs.ext4 /dev/sda4 -L home

mount /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
swapon /dev/sda3
mount /dev/sda4 /mnt/home

pacstrap /mnt base base-devel linux linux-firmware neovim netctl

genfstab -pU  /mnt >> /mnt/etc/fstab

arch-chroot /mnt

# >> Настройка системы

echo "[Service]" > /etc/systemd/system/getty@tty1.service.d/override.conf
echo "ExecStart=" >> /etc/systemd/system/getty@tty1.service.d/override.conf
echo "ExecStart=-/usr/bin/agetty --autologin snoyter --noclear %I $TERM" >> /etc/systemd/system/getty@tty1.service.d/override.conf

echo navi > /etc/hostname

ln -svf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen 
locale-gen

echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf

echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf

mkinitcpio -p linux

pacman -Syy
pacman -S grub --noconfirm 
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

#?
pacman -S dialog wpa_supplicant --noconfirm 

useradd -m -g users -G wheel -s /bin/bash snoyter

passwd
passwd snoyter

echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

echo '[multilib]' >> /etc/pacman.conf
echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf
pacman -Syy

pacman -S xorg-server xorg-drivers xorg-xinit --noconfirm 

pacman -S ttf-hack --noconfirm 

pacman -S networkmanager network-manager-applet ppp --noconfirm

systemctl enable NetworkManager

# >> Установка программ

pacman -S i3-wm conky htop git pulseaudio picom mplayer ranger

git clone https://github.com/snoyter/dotfiles
cp -r dotfiles/.config ~

su
cp dotfiles/programms/st/st /bin
cp dotfiles/programms/dmenu/dmenu /bin
exit 

cp dotfiles/.b* ~
cp dotfiles/.xinitrc ~ 
cp dotfiles/.gitconfig
