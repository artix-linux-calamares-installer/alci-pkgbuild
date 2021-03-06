#!/bin/sh
echo "################################################################"
echo "################### Making the package"
echo "################################################################"
filename=$(echo $(pwd| awk -v FS='/' '{print $NF}')"-")
ls ../../../../alci-repo/x86_64/ | grep $filename | xargs -I {} rm -rf ../../../../alci-repo/x86_64/{}
makepkg -src --noconfirm
mv *.pkg.tar.zst ../../../../alci-repo/x86_64/
echo "################################################################"
echo "################### Moved the .zst file to x86_64 folder"
echo "################################################################"
find . -type d -not -path "." -exec sudo rm -r "{}" \;
find . -type f -not -name "*.sh" -not -name "*.install" -not -name PKGBUILD -not -name "*.pkg.tar.zst" -delete
echo "################################################################"
echo "################### Removed all redundant files and folders"
echo "################################################################"
