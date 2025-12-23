#!/bin/bash

echo "Tienes yay?"
echo "1) SI"
echo "2) NO"

read -p "Introduce el número: " opcion

case $opcion in
1)
echo "Comenzando con la instalacion de waybar (Ya incluye un tema)"

sudo pacman --noconfirm -S waybar

echo "Ya instalado se ejecuta para una configuracion inicial"
waybar &

echo "Instalaremos las dependencias necesarias para su correcto funcionamiento"

sudo pacman --noconfirm -S wlogout

sudo pacman --noconfirm -S mission-center

echo "Instalamos las fuentes necesarias"

yay --noconfirm -S ttf-jetbrains-mono-nerd

echo "Cerramos waybar"

pkill waybar

echo "Procedemos a copiar la configuracion a la carpeta necesaria"
cp -r waybar ~/.config

echo "volvemos a iniciar waybar"
waybar &

echo "Se ha creado un archivo de texto en tus documentos donde podras conocer las funciones de los dots"
cp -r README/Funciones.txt ~/Documentos

echo "Lo encontraras en tu carpeta de Documentos en la carpeta README"

2)
echo "Instalamos yay"

sudo pacman --noconfirm -S --needed base-devel git

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

echo "Comenzando con la instalacion de waybar (Ya incluye un tema)"

sudo pacman --noconfirm -S waybar

echo "Ya instalado se ejecuta para una configuracion inicial"
waybar &

echo "Instalaremos las dependencias necesarias para su correcto funcionamiento"

sudo pacman --noconfirm -S wlogout

sudo pacman --noconfirm -S mission-center

echo "Instalamos las fuentes necesarias"

yay --noconfirm -S ttf-jetbrains-mono-nerd

echo "Cerramos waybar"

pkill waybar

echo "Procedemos a copiar la configuracion a la carpeta necesaria"
cp -r waybar ~/.config

echo "volvemos a iniciar waybar"
waybar &

echo "Se ha creado un archivo de texto en tus documentos donde podras conocer las funciones de los dots"
cp -r README/Funciones.txt ~/Documentos

echo "Lo encontraras en tu carpeta de Documentos en la carpeta README"


