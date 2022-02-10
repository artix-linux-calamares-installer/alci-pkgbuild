#!/bin/sh
echo "################################################################"
echo "################### Making the package"
echo "################################################################"
filename=$(echo $(pwd| awk -v FS='/' '{print $NF}')"-"$(cat ./PKGBUILD | grep "pkgver="|awk -v FS='=' '{print $NF}')"-")
ls ../../alci-iso-repo/x86_64/ | grep $filename | xargs -I {} rm -rf ../../alci-iso-repo/x86_64/{}
updpkgsums
paru -S --noconfirm --needed ckbcomp
makepkg -sc --noconfirm
sudo pacman -Rns $(pacman -Qtdq)
paru -Rns ckbcomp
mv *.pkg.tar.zst ../../alci-iso-repo/x86_64/
echo "################################################################"
echo "################### Moved the .zst file to x86_64 folder"
echo "################################################################"
sudo rm -rf pkg
sudo rm -rf src
rm -r ~/.cmake
find . -type f  | grep -i "calamares-.*$"  | xargs rm -rf
