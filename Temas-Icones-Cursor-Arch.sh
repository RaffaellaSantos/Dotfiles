#!/bin/bash
set -e

echo "🧩 Instalando dependências..."
sudo pacman -S --needed git base-devel gnome-tweaks gnome-shell-extensions

echo "📦 Instalando temas via AUR..."

# Tema Pop!_OS
yay -S --needed pop-gtk-theme

# Ícones Papirus
yay -S --needed papirus-icon-theme

# Cursor (igual da imagem que você usa)
yay -S --needed twilight-cursors

# Fonte Inter (usada no Pop)
sudo pacman -S --needed ttf-inter

echo "🎛️ Aplicando tema..."

gsettings set org.gnome.desktop.interface gtk-theme "Pop-dark"
gsettings set org.gnome.shell.extensions.user-theme name "Pop-dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "Twilight-cursors"
gsettings set org.gnome.desktop.interface font-name "Inter 10"

echo "🔌 Habilitando User Themes..."
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com || true

echo "✅ Visual estilo Pop aplicado!"
echo "Se algo não aplicar, faça logout."