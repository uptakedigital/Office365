<# CIAOPS
Script provided as is. Use at own risk. No guarantees or warranty provided.

## Description - Install the relevant Microsoft Online PowerShell modules

Source - https://github.com/directorcia/Office365/blob/master/o365-setup.ps1

Prerequisites = 1
1. Run PowerShell environment as an administrator

More scripts available by joining http://www.ciaopspatron.com

#>

## Variables
$systemmessagecolor = "cyan"
$processmessagecolor = "green"
$errormessagecolor = "red"

## If you have running scripts that don't have a certificate, run this command once to disable that level of security
## set-executionpolicy -executionpolicy bypass -scope currentuser -force

Clear-Host

write-host -foregroundcolor $systemmessagecolor "Start Script`n"

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
If ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    write-host -foregroundcolor $processmessagecolor "NuGet provider"
    Install-PackageProvider -Name NuGet -Force
    write-host -foregroundcolor $processmessagecolor "Install Azure AD module"
    Install-Module -Name AzureAD -force
    write-host -foregroundcolor $processmessagecolor "Install Azure AD Right Management module"
    Install-Module -Name AADRM -force
    write-host -foregroundcolor $processmessagecolor "Install Teams Module"
    Install-Module -Name MicrosoftTeams -Force
    write-host -foregroundcolor $processmessagecolor "Install SharePoint Online module"
    Install-Module -Name Microsoft.Online.SharePoint.PowerShell -force
    write-host -foregroundcolor $processmessagecolor "Install Microsoft Online module"
    Install-Module -Name MSOnline -force
    write-host -foregroundcolor $processmessagecolor "Install Exchange Online V2 module"
    Install-Module PowershellGet -Force
    Install-Module -Name ExchangeOnlineManagement -force
    write-host -foregroundcolor $processmessagecolor "Install Azure module"
    ## Old Azuer module
    ## Install-Module -name AzureRM -Force
    ## New Az module
    Install-Module -name Az -force
    write-host -foregroundcolor $processmessagecolor "Install SharePoint PnP module"
    Install-Module SharePointPnPPowerShellOnline -Force
}
else {
    write-host -foregroundcolor $errormessagecolor "*** ERROR *** - Please re-run PowerShell environment as Administrator`n"
}


write-host -foregroundcolor $systemmessagecolor "Script completed`n"