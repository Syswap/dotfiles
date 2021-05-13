echo "https://syswap.fr"
echo "https://github.com/Syswap/dotfiles"
echo "Thanks you for using my script <3"

cp -r dotfiles/.config ~/.config
cp -r dotfiles/.icons ~/.icons
cp -r dotfiles/.oh-my-zsh ~/.oh-my-zsh
cp -r dotfiles/.themes ~/.themes
cp -r dotfiles/fonts ~/.local/share/fonts
cp -r dotfiles/wallpaper ~/wallpaper
cp dotfiles/.p10k.zsh ~/.p10k.zsh
cp dotfiles/.zshrc ~/.zshrc
cp /etc/picom.conf /etc/xdg/picom.conf.bak
cp dotfiles/etc/xdg/picom.conf /etc/xdg/picom.conf

sudo pacman -U polybar-3.5.5-2-x86_64.pkg.tar.zst
sudo pacman -U ttf-meslo-nerd-font-powerlevel10k-1.000-3-any.pkg.tar.zst
