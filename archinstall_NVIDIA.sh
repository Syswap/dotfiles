echo "https://syswap.fr"
echo "https://github.com/Syswap/dotfiles"
echo "Thanks you for using my script <3"

echo "Installating packages"

echo "Basics packages"
pacstrap /mnt linux linux-firmware linux-headers base base-devel git wget curl grub efibootmgr ntfs-3g os-prober dhcpcd dhclient wpa_supplicant dialog networkmanager network-manager-applet

echo "Graphics drivers"


echo "nVidia"
pacstrap /mnt nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

echo "DE"
pacstrap /mnt i3 sddm picom kitty discord telegram-desktop nautilus lxappearance vivaldi vivaldi-ffmpeg-codecs lutris steam feh spectacle code

pacstrap /mnt noto-fonts gnu-free-fonts ttf-hack

pacstrap /mnt wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs 

echo "Basics system config"
genfstab -U -p /mnt > /mnt/etc/fstab

arch-chroot /mnt /bin/bash <<EOF



ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
echo 'fr_FR.UTF-8 UTF-8' >> /etc/locale.gen
echo 'fr_FR ISO-8859-1' >> /etc/locale.gen
echo 'fr_FR@euro ISO-8859-15' >> /etc/locale.gen
locale-gen
echo LANG="fr_FR.UTF-8" > /etc/locale.conf
export KEYMAP=fr > /etc/vconsole.conf

mkinitcpio -p linux

mkdir -p /boot/efi
grub-install --target=i386-pc --no-floppy --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable sddm && systemctl enable NetworkManager
echo 'setxkbmap fr' >> /usr/share/sddm/scripts/Xsetup 
EOF

echo "Arch are installed"

echo "Now, you can configure your system"