# Installation and Setup

This article is temporary. To install on Windows, use the Powershell installer script below:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ytp-plus.github.io/Install-YTPPlusSuite.ps1'))
```

!> As with any Powershell script, you should check to make sure the [script file](https://ytp-plus.github.io/Install-YTPPlusSuite.ps1) is safe to use and execute on your pc.
</br>This script will install [Chocolatey](https://chocolatey.org/), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), and [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI).
</br>There may be an error regarding lzma-native, if possible this can be ignored.

To install and run on Debian-based Linux distributions, use the following commands:

```bash
sudo add-apt-repository ppa:bartbes/love-stable #love2d's ppa
sudo apt update
sudo apt install nodejs git love
git clone https://github.com/YTP-Plus/YTPPlusStudio.git
cd ./YTPPlusStudio
git clone https://github.com/YTP-Plus/YTPPlusCLI.git
cd ./YTPPlusCLI
npm install #feel free to use the '--global' flag to use ytp+ cli standalone (as the 'ytpplus' command)
cd ..
love ./
```

More detailed instructions and macOS instructions are to come soon.