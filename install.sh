#!/bin/bash

function show_progress_dialog {
    (
        echo "0"; sleep 1
        echo "# Instalando dependencias..."; sleep 1
        echo "50"; sleep 1
        echo "# Configurando..."; sleep 1
        echo "100"; sleep 1
    ) | zenity --progress --auto-close --title="Progreso" --text="Iniciando..." --percentage=0
}

# Verificar la distribución y utilizar el gestor de paquetes adecuado
if [[ -n "$(command -v apt-get)" ]]; then
    # Instalar paquetes en Ubuntu y distribuciones basadas en Debian
    echo "Instalando dependencias..."
    sudo apt-get install -y gnome-screenshot tesseract-ocr wl-clipboard zenity
elif [[ -n "$(command -v dnf)" ]]; then
    # Instalar paquetes en Fedora y distribuciones basadas en Red Hat
    echo "Instalando dependencias..."
    sudo dnf install -y gnome-screenshot tesseract wl-clipboard zenity
elif [[ -n "$(command -v pacman)" ]]; then
    # Instalar paquetes en Arch Linux y distribuciones basadas en Arch Linux
    echo "Instalando dependencias..."
    sudo pacman -Sy --noconfirm gnome-screenshot tesseract tesseract-data-eng wl-clipboard zenity
else
    # Si no se detecta un gestor de paquetes compatible, muestra un mensaje de error
    echo "Error: no se pudo detectar un gestor de paquetes compatible en tu sistema."
    exit 1
fi

# Mostrar la barra de progreso
show_progress_dialog &

# Dando permisos necesarios y moviendo el fichero
chmod +x gstxt
sudo mv gstxt /usr/local/bin

# Esperar a que termine la barra de progreso
wait

# Verificación de la instalación
if [ $? -eq 0 ]; then
    zenity --info --text "La instalación se ha completado correctamente."
else
    zenity --error --text "Hubo un error durante la instalación."
fi
