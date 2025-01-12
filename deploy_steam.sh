#!/usr/bin/bash
printf 'Do you want a fresh export (y/n)? '
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then 
    echo "Exporting fresh from Godot"
    ~/Godot/4.3-steam-mp/godotsteam.multiplayer.43.editor.linux.x86_64 --path ../ --export-release --headless "Linux"
    ~/Godot/4.3-steam-mp/godotsteam.multiplayer.43.editor.linux.x86_64 --path ../ --export-release --headless "Windows"
    wait
else
    echo "Skipped fresh exports"
fi

./steamcmd.sh +login <YOUR ACCOUNT> +run_app_build ./scripts/app_3454830.vdf +quit