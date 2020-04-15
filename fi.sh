echo '>> Установка системы'

echo 'Загружаем русские буквы в консоль'
loadkeys ru
setfont cyr-sun16
sleep 10

#iwconfig
#read -p "Имя интерфейса" wifi
#wifi-menu wifi

echo 'Синхронизируем время'
timedatectl set-ntp true
timedatectl set-timezone Asia/Novosibirsk
timedatectl status
sleep 10

echo 'Разбиваем диск'
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
sleep 10

echo 'Форматируем диск'
mkfs.ext2 /dev/sda1 -L boot
mkfs.ext4 /dev/sda2 -L root
mkswap /dev/sda3 -L swap
mkfs.ext4 /dev/sda4 -L home
sleep 10

echo 'Монтируем диск'
mount /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
swapon /dev/sda3
mount /dev/sda4 /mnt/home
sleep 10

echo 'Сортируем зеркала'
pacman -Syy
pacman -S reflector
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
reflector -c "RU" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
sleep 10

echo 'Установка системы'
pacstrap /mnt base base-devel linux linux-firmware neovim netctl --noconfirm 

echo '>> Настройка системы'

genfstab -U  /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime
hwclock --systohc
sleep 10

echo 'Настройка локали'

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen 
locale-gen

echo 'LANG="ru_RU.UTF-8"' > /etc/locale.conf

echo 'KEYMAP=ru' >> /etc/vconsole.conf
echo 'FONT=cyr-sun16' >> /etc/vconsole.conf

echo 'Настройка хоста'
echo "navi" > /etc/hostname
echo '127.0.0.1	localhost' > /etc/hosts
echo '::1		localhost' >> /etc/hosts
echo '127.0.1.1	navi.localdomain navi' >> /etc/hosts
sleep 15

echo 'Создание загрузочного RAM диска'
mkinitcpio -p linux

echo 'Пароль для рута'

passwd

#The end of the main tasks

echo 'Установка GRUB'
pacman -Sy grub --noconfirm 
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
sleep 10

pacman -S dialog wpa_supplicant --noconfirm 

useradd -m -g users -G wheel -s /bin/bash snoyter

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
