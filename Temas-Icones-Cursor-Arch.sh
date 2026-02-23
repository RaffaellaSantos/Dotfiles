#!/bin/bash
set -e

echo "🧩 Instalando dependências..."
sudo pacman -S --needed git base-devel gnome-tweaks gnome-shell-extensions inter-font

echo "📦 Instalando temas..."

# Tema Pop!_OS
yay -S --needed pop-gtk-theme

# Ícones Papirus
sudo pacman -S --needed papirus-icon-theme

# Cursor moderno parecido com Pop
yay -S --needed bibata-cursor-theme

echo "🎛 Aplicando tema..."

gsettings set org.gnome.desktop.interface gtk-theme "Pop-dark"
gsettings set org.gnome.shell.extensions.user-theme name "Pop-dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Ice"
gsettings set org.gnome.desktop.interface font-name "Inter 10"

echo "🔌 Habilitando User Themes..."
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com || true

echo "✅ Visual estilo Pop aplicado!"