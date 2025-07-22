## Scripts Directory

Below is a list and summary of each PowerShell remediation script included in the `scripts/` folder. Each `.ps1` file is labeled with the corresponding STIG ID(s) and includes detailed usage instructions and logging output. These scripts were created based on failed controls identified in the initial Tenable STIG scan.

- **Set-DEP-OptOut.ps1**  
  Configures Data Execution Prevention (DEP) to "OptOut" mode using `bcdedit`, enhancing protection against memory attacks.

- **Disable-PowerShell2.ps1**  
  Disables the legacy PowerShell 2.0 engine, which lacks modern security logging and is vulnerable to downgrade attacks.

- **Disable-SecondaryLogon.ps1**  
  Disables the Secondary Logon (seclogon) service, which can be exploited to run elevated commands in user sessions.

- **Disable-WDigest.ps1**  
  Disables WDigest authentication to prevent Windows from storing cleartext passwords in memory.

- **Disable-AutoPlay.ps1**  
  Turns off AutoPlay and AutoRun for all drives and media types, reducing the risk of malware spread via external devices.

- **Set-EventLogSize.ps1**  
  Sets minimum log sizes for Application (32MB), Security (1000MB), and System (32MB) event logs to comply with STIG thresholds.

- **Set-AccountLockoutPolicy.ps1**  
  Enforces account lockout settings: 3 failed login attempts, 15-minute lockout duration, and a 15-minute reset counter.

- **Set-PasswordPolicy.ps1**  
  Configures password policy to require at least 14 characters and enables complexity rules (e.g., upper/lowercase, numbers).

- **Set-MinimumPasswordAge.ps1**  
  Prevents users from changing passwords too frequently by setting the minimum password age to 1 day.

- **Set-MinimumPasswordAge.ps1**  
  Renames the default Windows Guest account to prevent exploitation by attackers who target accounts with known names.
