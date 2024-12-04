include paths.sh

# arduino appimage new name
#AIDE_APP=arduino_ide.AppImage

# arduino path
#AIDE_FD=$HOME/ArduinoIDE
AIDE_FD=/opt/arduino-1.8.19
LEO_CFG=leo_cfg.zip
# download Arduino IDE appimage
#AIDE_URL="https://downloads.arduino.cc/arduino-ide/arduino-ide_2.3.3_Linux_64bit.AppImage"
AIDE_URL="https://downloads.arduino.cc/arduino-1.8.19-linux64.tar.xz"
# make arduino directory inside home folder
#mkdir -p "$AIDE_FD"
#wget $AIDE_URL -O "$AIDE_FD"/"$AIDE_APP"

AIDE_TAR=aide_tar
wget https://downloads.arduino.cc/arduino-1.8.19-linux64.tar.xz -O "$AIDE_TAR"
sudo tar -xvf "$AIDE_TAR" -C /opt
rm "$AIDE_TAR"
# enable Arduino Serial ports access
sudo bash -c "echo \'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"2341\", GROUP=\"plugdev\", MODE=\"0666\"\' >> /etc/udev/rules.d/99-arduino.rules"

# change appimage perms and deactivate apparmor restrictions
#chmod +x "$AIDE_FD"/"$AIDE_APP"
#sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0

# cp icon and .desktop entry to specific paths
#cp "$RES_DIR"/arduino.png "$AIDE_FD"
#mkdir -p "$HOME"/.local/share/applications
#cp "$SCRIPT_DIR"/arduino.desktop "$HOME"/.local/share/applications

# install
sudo ."$AIDE_FD"/install.sh
sudo usermod -a -G dialout $USER

# download Lattepanda Leonardo config
wget https://drive.usercontent.google.com/download?id=1rfrUShz9Y8ZYq2rywhecdoYYGGes5IEM&export=download -O "$LEO_CFG"
cp -r "$LEO_CFG"/Arduino\ IDE\ Files/avr-0.0.3 "$AIDE_FD"/hardware
echo "IMPORTANT! LOG OUT AND LOG IN to complete installation"
rm -rf "$LEO_CFG"
