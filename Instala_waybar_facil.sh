#!/bin/bash

echo "Comenzando con la instalacion de waybar (Ya incluye un tema)"

sudo pacman --noconfirm -S waybar

echo "Ya instalado se ejecuta para una configuracion inicial"
waybar &

echo "Instalaremos las dependencias necesarias para su correcto funcionamiento"

sudo pacman --noconfirm -S wlogout

sudo pacman --noconfirm -S mission-center

echo "Procedemos a copiar la configuracion a la carpeta necesaria"
cp -r waybar ~/.config

echo "Reiniciamos waybar"

pkill waybar
waybar &

echo "Se ha creado un archivo de texto en tus documentos donde podras conocer las funciones de los dots"
cp -r README/Funciones.txt ~/Documentos

echo "Lo encontraras en tu carpeta de Documentos en la carpeta README"


