#!/usr/bin/bash
printf 'Do you want a fresh export (y/n)? '
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo "Exporting fresh from Godot"
    ~/Godot/4.3-steam-mp/godotsteam.multiplayer.43.editor.linux.x86_64 --path ../ --export-release --headless "Linux Itch"
    ~/Godot/4.3-steam-mp/godotsteam.multiplayer.43.editor.linux.x86_64 --path ../ --export-release --headless "Windows Itch"
    wait
else
    echo "Skipped fresh exports"
fi

# Zip all folders
echo "Zip Export Directories"

echo "Zipping Windows Itch"
zip -r -j -v ./uploads/SurfsUp.zip ./"Windows Itch/"

echo "Zipping Linux Itch"
zip -r -j -v ./uploads/SurfsUp-Linux.zip ./"Linux Itch/"
wait


# Upload to Itch.io
echo "Uploading Windows to Itch"
butler push ./uploads/SurfsUp.zip bearlikelion/surfs-up:windows

echo "Uploading Linux to Itch"
butler push ./uploads/SurfsUp-Linux.zip bearlikelion/surfs-up:linux
wait


# Delete local uploaded zips
printf 'Do you want to delete uploaded files (y/n)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then     
    echo "Deleting upload zips"
    rm ./uploads/SurfsUp.zip
    rm ./uploads/SurfsUp-Linux.zip
else
    echo "Skipped Deleting Zips"
fi
