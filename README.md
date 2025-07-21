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

| STIG ID(s)                      | Summary                                                 | Link                                                         |
|---------------------------------|---------------------------------------------------------|--------------------------------------------------------------|
| WN10-AU-000500 / -000505 / -000510  | Increase size of Application, Security, and System event logs        | *[Event Log Sizes]*             |
| WN10-00-000155                  | Remove deprecated Windows PowerShell 2.0 feature                          | *[Disable PS2]*                                       |
| WN10-AC-000005 / -000010 / -000015 | Configure account lockout policy threshold and reset period | *[Account Lockout]*                                    |
| WN10-AC-000035 / -000040        | Enforce 14+ character passwords and complexity requirements      | *[Password Complexity]*                                       |
| WN10-CC-000180 / -000185 / -000190 | Disable AutoPlay for all drives and media               | *[Disable AutoPlay]*                                       |
| WN10-00-000145                  | Set Data Execution Prevention (DEP) policy to “OptOut” using BCDEDIT | *[Configure DEP]*                                       |
| WN10-CC-000038                  | WDigest authentication disabled                          | *[Disable WDigest]*                                       |
| WN10-00-000175                  | Secondary Logon Service disabled                         | *[Disable Secondary Logon]*                |


## Remediation Steps

1. Perform an initial vulnerability scan using Tenable using the DISA Microsoft Windows 10 STIG (v3r4) policy.
2. Identify failed STIG checks from the initial scan report.
3. Prioritize low-disruption, high-impact items.
4. Create and run PowerShell scripts to automate the remediation.
5. Perform a verification scan to confirm the STIG checks have passed.

## Scripts Directory

All PowerShell scripts may be found in the [`scripts/`](./scripts) folder. Each script includes additional documentation and instructions for use:

1. **[Set-EventLogSizes.ps1](./scripts/Set-STIG-EventLogSizes-GPO.ps1)**  
   - Configures larger log sizes for Application, System, and Security logs to ensure log sizes meet STIG standards.

2. **[Disable-PowerShell2.ps1](./scripts/Disable-PowerShell2.ps1)**  
   - Removes Windows PowerShell 2.0 to mitigate downgrade attacks.

3. **[Disable-WDigest.ps1](./scripts/Disable-WDigest.ps1)**  
   - Applies registry fix to disable WDigest.

4. **[Disable-AutoPlay.ps1](./scripts/Disable-AutoPlay.ps1)**  
   - Disables AutoRun/AutoPlay to reduce drive-based attack vectors.

5. **[Set-AccountLockout.ps1](./scripts/Set-AccountLockout.ps1)**  
   - Sets account lockout threshold, duration, and reset values.

6. **[Set-PasswordPolicy.ps1](./scripts/Set-PasswordPolicy.ps1)**  
   - Enables password complexity and length enforcement.

7. **[Disable-SecondaryLogon.ps1](./scripts/Disable-SecondaryLogon.ps1)**  
   - Disables the seclogon service for privilege reduction.

8. **[Set-DEP-OptOut.ps1](./scripts/Set-DEP-OptOut.ps1)**  
   - Updates DEP configuration for runtime memory protection.

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
