############################################################################################
####
#### Script to download and set the Lockscreen and Wallpaper for the user
####
###########################################

# Parameters for source and destination for the Image file
# Current script is edited to put the same image on LockScreen and Wallpaper

# Assigns the wallpaper 
$RegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"

$DesktopPath = "DesktopImagePath"
$DesktopStatus = "DesktopImageStatus"
$DesktopUrl = "DesktopImageUrl"
$LockScreenPath = "LockScreenImagePath"
$LockScreenStatus = "LockScreenImageStatus"
$LockScreenUrl = "LockScreenImageUrl"

$StatusValue = "1"

$url = "https://github.com/sanitexGlobal/fantastic-succotash/raw/main/SF-wallpaper.png"
$DesktopImageValue = "C:\MDM\wallpaper.jpg"
$directory = "C:\MDM\"

If ((Test-Path -Path $directory) -eq $false)
{
New-Item -Path $directory -ItemType directory
}

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $DesktopImageValue)

if (!(Test-Path $RegKeyPath))
{
	Write-Host "Creating registry path $($RegKeyPath)."
	New-Item -Path $RegKeyPath -Force | Out-Null
}

New-ItemProperty -Path $RegKeyPath -Name $DesktopStatus -Value $Statusvalue -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenStatus -Value $StatusValue -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $DesktopPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $DesktopUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenPath -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null
New-ItemProperty -Path $RegKeyPath -Name $LockScreenUrl -Value $DesktopImageValue -PropertyType STRING -Force | Out-Null