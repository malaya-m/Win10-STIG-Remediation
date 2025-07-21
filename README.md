# Windows 10 STIG Remediation Repository

This repository showcases how I identified, remediated, and verified Windows 10 (Azure VM) security misconfigurations based on the DISA STIG benchmarks using PowerShell scripts and Tenable vulnerability scans.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Initial Scan Results](#initial-scan-results)
3. [Remediation Steps](#remediation-steps)
4. [Priority STIG Remediations](#priority-stig-remediations)
5. [Scripts Directory](#scripts-directory)
6. [Initial Scan Results](#initial-scan-results)
7. [Post-Remediation Scan Results](#post-remediation-scan)
8. [Post-Remediation Testing](#post-remediation-testing)
9. [Next Steps (Maintenance Mode](#next-steps-maintenance-mode)

---

## Project Overview

- **Purpose**: This project demonstrates my hands-on ability to secure a Windows 10 system in alignment with DISA STIG guidelines. Using a Tenable Nessus STIG scan on an Azure-hosted VM, I remediated high-risk findings and validated the results.
- **Scope**: This project focuses on select remediations from the [DISA Microsoft Windows 10 STIG (v3r4)]((https://www.tenable.com/audits/DISA_STIG_Microsoft_Windows_10_v3r4)), prioritized by exploitability, ease of implementation, and system impact.

---

## Initial Scan Results

An initial STIG scan was performed on Tenable which detected numerous policy failures. 

Initial STIG scan results:
<img width="1064" height="278" alt="Screenshot 2025-07-21 at 4 43 24 PM" src="https://github.com/user-attachments/assets/fd76b268-0920-452b-a9a3-63404d687816" />
[View Scan Report]

---

## Remediation Steps

1. Perform an initial vulnerability scan using Tenable using the DISA Microsoft Windows 10 STIG (v3r4) policy.
2. Identify failed STIG checks from the initial scan report.
3. Prioritize low-disruption, high-impact items.
4. Create and run PowerShell scripts to automate the remediation.
5. Perform a post-remediation scan to confirm the STIG checks have passed.

---

## Priority STIG Remediations
The table below highlights the STIG remediations that were prioritized based on exploitability, ease of implementation, and system impact. The links provided in the left column lead to more detailed documentation within the `docs/` folder.


| STIG ID(s)                                  | Script Filename                   | Description                                                                 |
|--------------------------------------------|----------------------------------|-----------------------------------------------------------------------------|
| WN10-00-000145                              | `Set-DEP-OptOut.ps1`             | Sets Data Execution Prevention (DEP) to "OptOut" for enhanced runtime memory protection. |
| WN10-00-000155                              | `Disable-PowerShell2.ps1`        | Disables PowerShell 2.0 to prevent downgrade attacks and enable logging in newer versions. |
| WN10-00-000175                              | `Disable-SecondaryLogon.ps1`     | Disables the Secondary Logon service to minimize privilege abuse and session hijacking risks. |
| WN10-CC-000038                              | `Disable-WDigest.ps1`            | Disables WDigest authentication to prevent storage of plain-text credentials in memory. |
| WN10-CC-000180 / -000185 / -000190          | `Disable-AutoPlay.ps1`           | Disables AutoPlay and AutoRun features across all drives to prevent malware propagation. |
| WN10-AU-000500 / -000505 / -000510          | `Set-EventLogSize.ps1`           | Configures Application, Security, and System logs to meet minimum size requirements (32MB, 1000MB, 32MB). |
| WN10-AC-000005 / -000010 / -000015          | `Set-AccountLockoutPolicy.ps1`   | Enforces account lockout settings: 3 attempts, 15-minute duration and reset period. |
| WN10-AC-000035 / -000040                    | `Set-PasswordPolicy.ps1`         | Enforces strong password policies: minimum 14 characters and complexity enabled. |
| WN10-AC-000030                              | `Set-MinimumPasswordAge.ps1`     | Ensures users cannot change passwords repeatedly in a short time to bypass history restrictions. |

---

## 📂 Scripts Directory

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


---

## Post-Remediation Scan Results

After running each PowerShell script, a post-remediation scan was performed to validate the STIG checks have passed successfully. 

Post-remediation scan results:

[View Scan Report]

---

## Post-Remediation Testing

After each STIG remediation was applied, the following validation steps were performed to ensure the system remained secure and operational:

- **Verified Registry and Policy Changes**  
  Confirmed registry keys, local security policy settings, and service states were updated as expected.

- **Tested System Functionality**  
  Ensured system boot, login, user operations, and critical applications continued to function without issues.

- **Reviewed Updated Nessus Scan Reports**  
  Re-scanned the system using the Tenable Nessus STIG Compliance policy to validate that the remediated controls no longer appeared as findings.

- **Spot-Checked Operational Logs**  
  Reviewed Windows Event Viewer and `secedit` output for errors or misconfigurations introduced by changes.

- **Performed Rollback Tests (if applicable)**  
  Where feasible, validated the ability to revert changes without disrupting system integrity.

---

## Next Steps (Maintenance Mode)

To maintain a secure and compliant system posture beyond the initial remediations, the following practices will be adopted:

- **Conduct Regular Vulnerability Scans**  
  Perform periodic Tenable Nessus scans to detect newly introduced vulnerabilities and verify compliance over time.

- **Track STIG Updates**  
  Monitor DISA releases for new or revised Windows 10 STIG controls and integrate them into the remediation workflow as needed.

- **Monitor System and Security Logs**  
  Continuously review Event Viewer and audit logs to identify anomalous activity or misconfigurations.

- **Enhance Automation and Reporting**  
  Expand the use of PowerShell scripts for compliance checks and integrate reporting tools for streamlined documentation and audit readiness.
