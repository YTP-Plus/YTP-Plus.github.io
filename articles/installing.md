# Installation and Setup

This article is temporary. To install on Windows, use the Powershell installer script below:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ytp-plus.github.io/Install-YTPPlusSuite.ps1'))
```

!> As with any Powershell script, you should check to make sure the [script file](https://ytp-plus.github.io/Install-YTPPlusSuite.ps1) is safe to use and execute on your pc.
</br>This script will install [Chocolatey](https://chocolatey.org/), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI), and a temporary hotfix.
</br>There may be an error regarding lzma-native, if possible this can be ignored.

To install and run on Debian-based Linux distributions, run the following commands in order:

```bash
sudo add-apt-repository ppa:bartbes/love-stable #love2d's ppa
sudo apt update
sudo apt install nodejs git love
cd ~/
wget https://github.com/YTP-Plus/YTPPlusStudio/releases/latest/download/YTPPlusStudio.love
cd ./.local/share/
mkdir ./love
cd ./love/
mkdir ./ytpplusstudio_0
cd ./ytpplusstudio_0
git clone https://github.com/YTP-Plus/YTPPlusCLI.git
cd ./YTPPlusCLI
npm install #feel free to use the '--global' flag to use ytp+ cli standalone (as the 'ytpplus' command)
wget https://ytp-plus.github.io/hotfix.zip #temporary hotfix
tar -zxvf hotfix.zip
cd ..
love ~/YTPPlusStudio.love
```

!> These commands will install [LOVE](https://love2d.org/), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI), and a temporary hotfix.

To install and run on macOS, execute this bash script: (or download [here](https://ytp-plus.github.io/Install-YTPPlusSuite-macOS.sh))

```bash
bash <(curl -s https://ytp-plus.github.io/Install-YTPPlusSuite-macOS.sh)
```

!> This script will install [Homebrew](https://brew.sh/) (if not already installed), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [LOVE](https://love2d.org/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI), and a temporary hotfix.

More detailed and updating instructions are to come soon.