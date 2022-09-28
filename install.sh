#!/usr/bin/env sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `install.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cd $(dirname $BASH_SOURCE)
BASE=$(pwd)

echo "💻  Preparing Development Environment..."

# Check if on macOS with uname Darwin
if [ $(uname -s) = 'Darwin' ]; then
  # Check for Homebrew
  if test ! $(which brew); then
    echo "📦  Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi

echo "📥  Installing Homebrew Packages..."
brew bundle --verbose

# Switch to using brew-installed ZSH as default shell
if ! fgrep -q $(command -v zsh) /etc/shells; then
  command -v zsh | sudo tee -a /etc/shells
  chsh -s $(command -v zsh)
fi;

stow -v git misc zsh
stow -v -t ~/.config config

# Fix autocomp permission
chmod go-w '/usr/local/share'

mkdir -p ~/Pictures/Screenshots
source ./macOS.sh

# Install SFMono font
cp -v /Applications/Xcode.app/Contents/SharedFrameworks/DVTKit.framework/Versions/A/Resources/Fonts/SFMono-* ~/Library/Fonts

# Install curl certificate
# mkdir -p /usr/local/share/curl/
# wget http://curl.haxx.se/ca/cacert.pem -O /usr/local/share/curl/curl-ca-bundle.crt

echo "😀  Happy Hacking"
