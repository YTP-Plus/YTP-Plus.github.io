#!/bin/sh

os_name=$(awk -F= '/^NAME/{print $2}' /etc/os-release)

if [ ! "$os_name" = "\"Debian GNU/Linux\"" ]; then

    # The ppa seems to only be for Ubuntu, so I will not even ask on a debian system
    sudo add-apt-repository ppa:bartbes/love-stable #love2d's ppa
fi

sudo apt update
sudo apt install nodejs npm git love ffmpeg mediainfo frei0r-plugins -y
cd ~/Desktop/ || exit 1
cat >start-ytpplusstudio.sh <<EOF

#!/bin/sh
cd ~/.local/share/love/ytpplusstudio_1
love ./YTPPlusStudio.love
EOF
chmod +x ./start-ytpplusstudio.sh
#wget https://github.com/YTP-Plus/YTPPlusStudio/releases/latest/download/YTPPlusStudio.love
cd ..
cd ./.local/share/ || exit 1
mkdir ./love
cd ./love/ || exit 1
mkdir ./ytpplusstudio_1
cd ./ytpplusstudio_1 || exit 1 #needs to be in this place on non-windows platforms
wget https://github.com/YTP-Plus/YTPPlusStudio/releases/latest/download/YTPPlusStudio.love
git clone https://github.com/YTP-Plus/YTPPlusCLI.git
cd ./YTPPlusCLI || exit 1
git stash            #store local changes
git pull origin main #get new changes
git stash pop        #re-implement local changes
npm install          #feel free to use the '--global' flag to use ytp+ cli standalone (as the 'ytpplus' command)
mkdir ./node_modules
cd ./node_modules || exit 1
mkdir ./ffmpeg-cli
cd ffmpeg-cli || exit 1
mkdir ffmpeg
cd ffmpeg || exit 1
OUTPUT=$(which ffmpeg)
cp "${OUTPUT}" ./ffmpeg
cd ./../../.. #YTPPlusCLI
#any issues with npm install? delete node_modules/ and retry
cd ~/Desktop/ || exit 1
read -p "ytp+ suite installation successful!"
