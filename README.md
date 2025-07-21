# Windows 10 STIG Remediation Repository

This repository showcases how I identified, remediated, and verified Windows 10 (Azure VM) security misconfigurations based on the DISA STIG benchmarks using PowerShell scripts and Nessus vulnerability scans.

## Table of Contents

1. [Project Overview](#project-overview)
2. [High-Priority STIG Controls](#high-priority-stig-controls)
3. [Remediation Workflow](#remediation-workflow)
4. [Scripts Folder](#scripts-folder)
5. [Sub-Pages / Documentation](#sub-pages--documentation)
6. [Initial Nessus Scan Results](#initial-nessus-scan-results)

---

## Project Overview

- **Purpose**: This project demonstrates my hands-on ability to secure a Windows 10 system in alignment with DISA STIG guidelines. Using a Tenable Nessus STIG scan on an Azure-hosted VM, I remediated high-risk findings and validated the results.
- **Scope**: This project focuses on select remediations from the DISA Microsoft Windows 10 STIG (v3r4), prioritized by exploitability, ease of implementation, and system impact.

## Key STIG Remediations
The table below highlights the STIG remediations that were prioritized based on exploitability, ease of implementation, and system impact. The links in the right column lead to detailed documentation within the `docs/` folder.

## 📂 Scripts Directory

All remediation scripts are stored in the `scripts/` folder. Each `.ps1` file is labeled with the corresponding STIG ID(s) and includes detailed usage instructions and logging output. These scripts were created based on failed controls identified in the initial Nessus STIG scan.

| Script Filename                   | STIG ID(s)                                     | Description                                                                 |
|----------------------------------|------------------------------------------------|-----------------------------------------------------------------------------|
| `Set-EventLogSize.ps1`           | WN10-AU-000500 / -000505 / -000510             | Configures Application, Security, and System logs to meet minimum size requirements (32MB, 1000MB, 32MB). |
| `Disable-PowerShell2.ps1`        | WN10-00-000155                                 | Disables PowerShell 2.0 to prevent downgrade attacks and enable logging in newer versions. |
| `Set-AccountLockoutPolicy.ps1`   | WN10-AC-000005 / -000010 / -000015             | Enforces account lockout settings: 3 attempts, 15-minute duration and reset period. |
| `Set-PasswordPolicy.ps1`         | WN10-AC-000035 / -000040                       | Enforces strong password policies: minimum 14 characters and complexity enabled. |
| `Set-MinimumPasswordAge.ps1`     | WN10-AC-000030                                 | Ensures users cannot change passwords repeatedly in a short time to bypass history restrictions. |
| `Disable-WDigest.ps1`            | WN10-CC-000038                                 | Disables WDigest authentication to prevent storage of plain-text credentials in memory. |
| `Disable-AutoPlay.ps1`           | WN10-CC-000180 / -000185 / -000190             | Disables AutoPlay and AutoRun features across all drives to prevent malware propagation. |
| `Set-DEP-OptOut.ps1`             | WN10-00-000145                                 | Sets Data Execution Prevention (DEP) to "OptOut" for enhanced runtime memory protection. |
| `Disable-SecondaryLogon.ps1`     | WN10-00-000175                                 | Disables the Secondary Logon service to minimize privilege abuse and session hijacking risks. |


## Remediation Steps

1. Perform an initial vulnerability scan using Tenable using the DISA Microsoft Windows 10 STIG (v3r4) policy.
2. Identify failed STIG checks from the initial scan report.
3. Prioritize low-disruption, high-impact items.
4. Create and run PowerShell scripts to automate the remediation.
5. Perform a verification scan to confirm the STIG checks have passed.


## Baseline Scan Results


---

## Final Results

After running each PowerShell script, a verification scan was performed to validate remediation success. Updated scan results:

---

## Post-Remediation Testing

After each STIG remediation, it is important to perform basic operational checks:
- Verify event logs for errors or warnings.
- Test critical applications and workflows to ensure no disruptions.
- Monitor for any unexpected system behavior or compatibility issues.
- If a service or feature fails, consider temporarily rolling back that specific STIG setting or create an exception per organizational policy.

## Next Steps (Maintenance Mode)

In addition to addressing these initial vulnerabilities, the next plan of action will be to:
- Continue periodic scheduled vulnerability scans 
- Track new/updated STIGs
- Monitor system logs for anomalies
- Expand automation with compliance reporting
