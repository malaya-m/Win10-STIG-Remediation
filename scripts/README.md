## Scripts Directory

This folder contains each PowerShell remediation script. Each `.ps1` file is labeled with the corresponding STIG ID(s) and includes detailed usage instructions and logging output. These scripts were created based on failed controls identified in the initial Tenable STIG scan.

**Set-DEP-OptOut.ps1** - STIG ID: `WN10-00-000145` 
- Configures Data Execution Prevention (DEP) to "OptOut" mode using `bcdedit`, enhancing protection against memory attacks.

**Disable-PowerShell2.ps1** - STIG ID: `WN10-00-000155`
- Disables the legacy PowerShell 2.0 engine, which lacks modern security logging and is vulnerable to downgrade attacks.

**Disable-SecondaryLogon.ps1** - STIG ID: `WN10-00-000175`
- Disables the Secondary Logon (seclogon) service, which can be exploited to run elevated commands in user sessions.

**Disable-WDigest.ps1** - STIG ID: `WN10-CC-000038`
- Disables WDigest authentication to prevent Windows from storing cleartext passwords in memory.

**Disable-AutoPlay.ps1** - STIG IDs: `WN10-CC-000180`, `WN10-CC-000185`, `WN10-CC-000190`
- Turns off AutoPlay and AutoRun for all drives and media types, reducing the risk of malware spread via external devices.

**Set-EventLogSize.ps1** - STIG IDs: `WN10-AU-000500`, `WN10-AU-000505`, `WN10-AU-000510`
- Sets minimum log sizes for Application (32MB), Security (1000MB), and System (32MB) event logs to comply with STIG thresholds.

**Set-AccountLockoutPolicy.ps1** - STIG IDs: `WN10-AC-000005`, `WN10-AC-000010`, `WN10-AC-000015`
- Enforces account lockout settings: 3 failed login attempts, 15-minute lockout duration, and a 15-minute reset counter.

**Set-PasswordPolicy.ps1** - STIG IDs: `WN10-AC-000035`, `WN10-AC-000040`
- Configures password policy to require at least 14 characters and enables complexity rules (e.g., upper/lowercase, numbers).

**Set-MinimumPasswordAge.ps1** - STIG ID: `WN10-AC-000030`
- Prevents users from changing passwords too frequently by setting the minimum password age to 1 day.

**Rename-GuestAccount.ps1** - STIG ID: `WN10-00-000130`
- Renames the default Windows Guest account to prevent exploitation by attackers who target accounts with known names.
