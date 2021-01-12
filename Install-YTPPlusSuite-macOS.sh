#!/bin/sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" #installs homebrew -- remove if already installed
brew update
brew doctor
read -p "Please follow any advisories given by the above (brew doctor) before continuing. Press any key to continue..."
export PATH="/usr/local/bin:$PATH"
brew install node git
cd ~/Desktop
curl --show-error --location https://github.com/YTP-Plus/YTPPlusStudio/releases/latest/download/YTPPlusStudio.love --output YTPPlusStudio.love
#install ytp+ cli
cd ~/Library/Application Support
mkdir LOVE
cd LOVE
mkdir ytpplusstudio_0
cd ytpplusstudio_0
git clone https://github.com/YTP-Plus/YTPPlusCLI.git
cd ./YTPPlusCLI
npm install #feel free to use the '--global' flag to use ytp+ cli standalone (as the 'ytpplus' command)
#install love
mkdir -p /tmp/love2d
cd /tmp/love2d
rm -f love2d.zip
rm -f Applications
curl --show-error --location https://github.com/love2d/love/releases/download/11.3/love-11.3-macos.zip > love2d.zip
unzip love2d.zip
rm love2d.zip
mv love.app LÖVE.app
ln -s /Applications/ Applications
open ./
read -p "Install LÖVE by dragging it into your Applications folder. Once it is finished, you may press a key to exit. To launch ytp+ studio, open the .love file."