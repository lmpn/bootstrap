#!/bin/bash
set -e
set -o pipefail

cd ~/bootstrap
mkdir ~/.config
echo "Setting hostname..."
sudo scutil --set HostName seahorse

echo "Allow touchID for sudo"
sudo awk -v newline="auth       sufficient     pam_tid.so" 'NR==2{print; print newline; next}1' "/etc/pam.d/sudo" >tmpfile
sudo mv tmpfile /etc/pam.d/sudo

echo "Installing brew..."
sudo echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo >>/Users/lneto/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/lneto/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
echo "brew installed"

echo "install Oh-My-Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "Installing: curl, ripgrep, bat, bottom, dust, delta, fd, jq, yq, sqlite3, thefuck, bandwhich, neovim, colima, lazygit, lazydocker, fzf, curl, xh, tree, procs, docker, docker-compose, zsh"
brew install git \
  m-cli \
  curl \
  ripgrep \
  bat \
  bottom \
  dust \
  delta \
  fd \
  jq \
  yq \
  sqlite3 \
  thefuck \
  bandwhich \
  neovim \
  colima \
  lazygit \
  lazydocker \
  fzf \
  curl \
  xh \
  tree \
  procs \
  docker \
  docker-compose \
  zoxide \
  zsh
echo "Packages installed"

echo "Setting user defaults"
m wall.jpg ~/Pictures/wall.jpg
m dock autohide YES
m dock position LEFT
m finder showhiddenfiles YES
m finder showextensions YES
m hostname seahorse
m dock prune
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv" && killall Finder
defaults write -g AppleLanguages -array en

echo "Installing casks for brave, ghostty, ollama iosevka"
brew install --cask brave-browser ghostty ollama font-iosevka
echo "Casks installed"

echo "Installing rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs/ | sh

echo "Configure delta"
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3

echo "Starting colima"
colima start
colima stop
brew services start colima
