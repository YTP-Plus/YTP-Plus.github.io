# Installation and Setup

To install on Windows, use the Powershell installer script below:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ytp-plus.github.io/Install-YTPPlusSuite.ps1'))
```

!> As with any Powershell script, you should check to make sure the [script file](https://ytp-plus.github.io/Install-YTPPlusSuite.ps1) is safe to use and execute on your pc.

?>This script will install [Chocolatey](https://chocolatey.org/), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI), and a temporary hotfix.
</br>There may be an error regarding lzma-native, if possible this can be ignored.
</br>ytp+ studio will be present inside of your Start Menu after completion.

To install and run on Debian-based Linux distributions (such as Ubuntu), execute this bash script: (or download [here](https://ytp-plus.github.io/Install-YTPPlusSuite-Debian.sh))

```bash
bash <(curl -s https://ytp-plus.github.io/Install-YTPPlusSuite-Debian.sh)
```


?> This script will install [LOVE](https://love2d.org/), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI), and a temporary hotfix.
</br>ytp+ studio will be present inside of your user Desktop folder after completion.

To install on macOS, execute this bash script: (or download [here](https://ytp-plus.github.io/Install-YTPPlusSuite-macOS.sh))

```bash
bash <(curl -s https://ytp-plus.github.io/Install-YTPPlusSuite-macOS.sh)
```

?> This script will install [Homebrew](https://brew.sh/) (if not already installed), [NodeJS](https://nodejs.org/en/), [Git](https://git-scm.com/), [LOVE](https://love2d.org/), [ytp+ studio](https://github.com/YTP-Plus/YTPPlusStudio), [ytp+ cli](https://github.com/YTP-Plus/YTPPlusCLI), and a temporary hotfix.
</br>ytp+ studio will be present inside of your user Desktop folder after completion.

## Updating ytp+ suite

You may update using the same scripts, however if that is not functional you may follow these steps to proceed:

* ytp+ studio
	* Download the latest release zip file from [GitHub releases](https://github.com/YTP-Plus/YTPPlusStudio/releases/)
	* Extract it to your ytp+ studio directory (usually named ``YTPPlusStudio``) and replace everything.
	* You're finished!
* ytp+ cli
	* Determine if you need a new version, check the [version.txt on GitHub](https://github.com/YTP-Plus/YTPPlusCLI/blob/main/version.txt) and compare it to your ytp+ cli's version.txt file.
	* Open a terminal (or ``cmd`` on Windows) and navigate (``cd <directory>``) to your ytp+ cli directory (usually YTPPlusCLI, on non-Windows platforms this is present in ``~/.local/share/love/ytpplusstudio_0/`` and on macOS in ``~/Library/Application Support/LOVE/ytpplusstudio_0)``)
	* Run the following commands in order: 
		```bash
		git stash
		git pull origin main
		git stash pop
		```
	* You're finished!

## Help & Support

Submit an issue on [GitHub](https://github.com/YTP-Plus).

Join our [Discord](https://discord.gg/8ppmspR6Wh).
