#!/bin/sh
sudo add-apt-repository ppa:bartbes/love-stable #love2d's ppa
sudo apt update
sudo apt install nodejs npm git love ffmpeg frei0r-plugins -y
cd ~/Desktop/
wget https://github.com/YTP-Plus/YTPPlusStudio/releases/latest/download/YTPPlusStudio.love
cd ..
cd ./.local/share/
mkdir ./love
cd ./love/
mkdir ./ytpplusstudio_1
cd ./ytpplusstudio_1 #needs to be in this place on non-windows platforms
git clone https://github.com/YTP-Plus/YTPPlusCLI.git
cd ./YTPPlusCLI
git stash #store local changes
git pull origin main #get new changes
git stash pop #re-implement local changes
npm install #feel free to use the '--global' flag to use ytp+ cli standalone (as the 'ytpplus' command)
#any issues with npm install? delete node_modules/ and retry
cd ~/Desktop/
love ./YTPPlusStudio.love
read -p "ytp+ suite installation successful!"
