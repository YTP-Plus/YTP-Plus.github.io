#!/bin/sh
if ! command -v brew &> /dev/null
then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" #installs homebrew -- remove if already installed
brew update
brew doctor
read -p "Please follow any advisories given by the above (brew doctor) before continuing. Press any key to continue..."
export PATH="/usr/local/bin:$PATH"
brew install node git
fi
cd ~/Desktop
curl --show-error --location https://github.com/YTP-Plus/YTPPlusStudio/releases/latest/download/YTPPlusStudio.love --output YTPPlusStudio.love
#install ytp+ cli
cd ~/Library/Application\ Support
mkdir -p LOVE
cd LOVE
mkdir -p ytpplusstudio_0
cd ytpplusstudio_0
if [ -d "./YTPPlusCLI" ]
then
git clone https://github.com/YTP-Plus/YTPPlusCLI.git
fi
cd ./YTPPlusCLI
git stash #store local changes
git pull origin main #get new changes
git stash pop #re-implement local changes
npm install #feel free to use the '--global' flag to use ytp+ cli standalone (as the 'ytpplus' command)
#any issues with npm install? delete node_modules/ and retry
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
read -p "ytp+ suite installation successful! Install LÖVE by dragging it into your Applications folder. Once it is finished, you may press a key to exit. To launch ytp+ studio, open the .love file on your Desktop."
