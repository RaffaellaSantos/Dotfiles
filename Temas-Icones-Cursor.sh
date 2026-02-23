#!/bin/bash

# =============================
# Script de instalação de temas
# =============================
# Tema GTK e Shell: Orchis-Grey-Dark
# Ícones: Papirus-Dark
# Cursor: Twilight-cursors
# Compatível com GNOME (Pop!_OS / Ubuntu / Arch)
# =============================

set -e

echo "🧩 Instalando dependências..."
sudo apt update
sudo apt install -y git gnome-tweaks gnome-shell-extensions unzip wget

# =============================
# Diretórios locais
# =============================
mkdir -p ~/.themes ~/.icons

# =============================
# 🌑 1. Instalar tema Orchis
# =============================
echo "🎨 Baixando tema Orchis..."
cd ~/Downloads
if [ ! -d "Orchis-theme" ]; then
  git clone https://github.com/vinceliuice/Orchis-theme.git
fi

cd Orchis-theme
echo "🎨 Instalando Orchis-Grey-Dark..."
./install.sh -t grey -d ~/.themes

# =============================
# 🧱 2. Instalar ícones Papirus-Dark
# =============================
echo "🎨 Baixando ícones Papirus..."
sudo add-apt-repository -y ppa:papirus/papirus
sudo apt update
sudo apt install -y papirus-icon-theme

# =============================
# 🖱️ 3. Instalar cursores Twilight
# =============================
echo "🖱️ Baixando cursores Twilight..."
cd ~/Downloads
if [ ! -d "Twilight-Cursors" ]; then
  git clone https://github.com/ful1e5/Twilight-cursors.git
fi

cd Twilight-cursors
mkdir -p ~/.icons
cp -r dist/* ~/.icons/

# =============================
# 🎛️ 4. Aplicar temas
# =============================
echo "🎨 Aplicando temas..."
gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Grey-Dark"
gsettings set org.gnome.shell.extensions.user-theme name "Orchis-Grey-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "Twilight-cursors"

# =============================
# ✅ Finalização
# =============================
echo "✅ Instalação concluída!"
echo "Abra o GNOME Tweaks (Ajustes) → Aparência para verificar."