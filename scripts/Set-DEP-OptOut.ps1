<#
.SYNOPSIS
    This PowerShell script configures Data Execution Prevention (DEP) to “OptOut” mode using bcdedit to enforce runtime memory protections.

.NOTES
    Author          : Malaya Manacop
    LinkedIn        : linkedin.com/in/malaya-m
    GitHub          : github.com/malaya-m
    Date Created    : 2025-07-20
    Last Modified   : 2025-07-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000145

.TESTED ON
    Date(s) Tested  : 2025-07-20
    Tested By       : Malaya Manacop
    Systems Tested  : Windows 10 (Version 10.0.19045.5487)

.USAGE
    Run this script as Administrator in a PowerShell session.
    A system reboot is required for the changes to take effect.

    Example:
    PS C:\> .\Set-DEP-OptOut.ps1
#>

[CmdletBinding()]
param()

Write-Host "Configuring DEP to 'OptOut'..." -ForegroundColor Cyan

try {
    bcdedit /set '{current}' nx OptOut
    Write-Host "DEP successfully set to 'OptOut'. Please reboot your system." -ForegroundColor Green
}
catch {
    Write-Warning "Failed to set DEP: $($_.Exception.Message)"
    Write-Host "Possible causes: Secure Boot, BitLocker, or UEFI restrictions." -ForegroundColor Yellow
}
