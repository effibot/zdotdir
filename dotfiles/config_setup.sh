#! /bin/bash

source paths.sh
ZDOTDIR=~/.config/zsh

# install fonts
# bash -c "./$SCRIPT_DIR/install_fonts.sh"

# install nano syntax highlighting
# curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

# config shell
curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/mattmc3/zdotdir.git

echo 'eval "$(starship init bash)"' >> ~/.bashrc

# echo "eval \"$(starship init zsh)\"" >>


# set the amazing ZDOTDIR variable
ZDOTDIR=~/.config/zsh
mkdir -p "$ZDOTDIR"

# clone this repo
git clone --recursive git@github.com:effibot/zdotdir.git $ZDOTDIR

# change the root .zshenv file to use ZDOTDIR
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR=~/.config/zsh
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
EOF

chsh -s "$(which zsh)"
