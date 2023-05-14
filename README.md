# text-extractor
Permite extraer texto mediante una captura de pantalla en linux

## Dependencias
```bash
sudo apt-get install gnome-screenshot tesseract-ocr xclip zenity
```
## Instalación
```bash
chmod +x gnome-screenshot-text-extraction
sudo mv gnome-screenshot-text-extraction /usr/share/bin
sudo mv gnome-screenshot-text-extraction.desktop /usr/share/applications
```
## uso
```bash
gnome-screenshot-text-extraction
```
El maus cambiara de forma a una cruz, esto indica que ya podemos realizar seleccion del area de interes para extraer el texto.

