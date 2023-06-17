#!/bin/bash
# Instalación de dependencias
echo "Instalando dependencias..."
# Comandos para instalar las dependencias necesarias
# Verificar la distribución y utilizar el gestor de paquetes adecuado
if [[ -n "$(command -v apt-get)" ]]; then
    # Instalar paquetes en Ubuntu y distribuciones basadas en Debian
    sudo apt-get install -y gnome-screenshot tesseract-ocr wl-clipboard zenity
elif [[ -n "$(command -v dnf)" ]]; then
    # Instalar paquetes en Fedora y distribuciones basadas en Red Hat
    sudo dnf install -y gnome-screenshot tesseract wl-clipboard zenity
elif [[ -n "$(command -v pacman)" ]]; then
    # Instalar paquetes en Arch Linux y distribuciones basadas en Arch Linux
    sudo pacman -Sy --noconfirm gnome-screenshot tesseract tesseract-data-eng wl-clipboard zenity
else
    # Si no se detecta un gestor de paquetes compatible, muestra un mensaje de error
    echo "Error: no se pudo detectar un gestor de paquetes compatible en tu sistema."
    exit 1
fi

# Dando permisos necesarios y moviendo el fichero
chmod +x gstxt
sudo mv gstxt /usr/local/bin

# Verificación de la instalación
if [ $? -eq 0 ]; then
    echo "La instalación se ha completado correctamente."
else
    echo "Hubo un error durante la instalación."
fi
