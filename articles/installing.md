# Installation and Setup

This article is temporary. To install on Windows, use the Powershell installer script below:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ytp-plus.github.io/Install-YTPPlusSuite.ps1'))
```

!> As with any Powershell script, you should check to make sure the [script file](https://ytp-plus.github.io/Install-YTPPlusSuite.ps1) is safe to use and execute on your pc.
</br>This script will install [Chocolatey](https://chocolatey.org/), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), and [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI).
</br>There may be an error regarding lzma-native, if possible this can be ignored.

To install and run on Debian-based Linux distributions, run the following commands in order:

```bash
sudo add-apt-repository ppa:bartbes/love-stable #love2d's ppa
sudo apt update
sudo apt install nodejs git love
mkdir ./YTPPlusStudio
cd ./YTPPlusStudio
wget https://github.com/YTP-Plus/YTPPlusStudio/releases/latest/download/YTPPlusStudio.love
git clone https://github.com/YTP-Plus/YTPPlusCLI.git
cd ./YTPPlusCLI
npm install #feel free to use the '--global' flag to use ytp+ cli standalone (as the 'ytpplus' command)
cd ..
love YTPPlusStudio.love
```

!> These commands will install [LÖVE](https://love2d.org/), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), and [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI).

To install and run on macOS, make this bash script and execute it: (or download [here](https://ytp-plus.github.io/Install-YTPPlusSuite-macOS.sh))

```bash
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
cd ~/Library/Application\ Support
mkdir -p LOVE
cd LOVE
mkdir -p ytpplusstudio_0
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
```

!> This script will install [Homebrew](https://brew.sh/), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [LÖVE](https://love2d.org/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), and [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI).

More detailed and updating instructions are to come soon.