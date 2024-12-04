#! /bin/bash
# download nerd-fonts
font_dir="$HOME/.fonts"
mkdir -p "$font_dir"
wget https://raw.githubusercontent.com/IlanCosman/tide/refs/heads/assets/fonts/mesloLGS_NF_bold_italic.ttf -O "$font_dir"/mesloLGS_NF_bold_italic.ttf
wget https://raw.githubusercontent.com/IlanCosman/tide/refs/heads/assets/fonts/mesloLGS_NF_italic.ttf -O "$font_dir"/mesloLGS_NF_italic.ttf
wget https://raw.githubusercontent.com/IlanCosman/tide/refs/heads/assets/fonts/mesloLGS_NF_bold.ttf -O "$font_dir"/mesloLGS_NF_bold.ttf
wget https://raw.githubusercontent.com/IlanCosman/tide/refs/heads/assets/fonts/mesloLGS_NF_regular.ttf -O "$font_dir"/mesloLGS_NF_regular.ttf
fc-cache -f
