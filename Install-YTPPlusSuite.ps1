$rootDir = "..\..\YTPPlusStudio"

if (!(Test-Path $rootDir)) {
    New-Item -Path $(Split-Path -Path $rootDir) -Name $(Split-Path -Path $rootDir -Leaf) -ItemType "directory"
}

$fullRootDir = [IO.Path]::GetFullPath($rootDir)

$installDirectory = $fullRootDir + "\YTPPlusCLI"
$shellObject = New-Object -ComObject WScript.Shell
$extractShell = New-Object -ComObject Shell.Application
$shortcutLnk = $shellObject.SpecialFolders("AllUsersPrograms") + "\ytp+ studio.lnk"
$installUrl = "https://github.com/YTP-Plus/YTPPlusStudio/releases/latest/download/windows.zip"
$zipFile = $env:TEMP + "\" + $(Split-Path -Path $installUrl -Leaf)

if(!(Get-Command "choco" -errorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

choco upgrade chocolatey nodejs -y
choco upgrade git -y --params "/NoShellIntegration /GitOnlyOnPath"

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Update-SessionEnvironment

if(Get-Command "git" -errorAction SilentlyContinue) {
    if (!(Test-Path $installDirectory)) {
        git clone "https://github.com/YTP-Plus/YTPPlusCLI.git" $installDirectory
    }
    Set-Location $installDirectory

    git stash
    git pull origin main
    git stash pop
    npm install #Any issues with npm install? Delete node_modules/ and retry.

    Invoke-WebRequest -Uri $installUrl -OutFile $zipFile
    $fullPath = [IO.Path]::GetFullPath($zipFile)
    $namespace = $extractShell.Namespace($fullPath)
    $files = $namespace.Items()
    $extractShell.NameSpace($fullRootDir).CopyHere($files, 0x14)

    If (Test-Path $shortcutLnk) {
        Remove-Item $shortcutLnk
    }

    $shortcut = $shellObject.CreateShortcut($shortcutLnk)
    $shortcut.IconLocation = [IO.Path]::GetFullPath($fullRootDir+"\YTPPlusStudio.exe")
    $shortcut.TargetPath = [IO.Path]::GetFullPath($fullRootDir+"\YTPPlusStudio.exe")
    $shortcut.Save()

    Remove-Item $zipFile

    Write-Output "ytp+ suite installation successful!"
    Pause
}
else {
    Write-Output "Please restart your PC and re-execute this script to refresh environment variables."
}
