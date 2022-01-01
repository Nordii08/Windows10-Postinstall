# This script disables Windows services that I do not need. Reduces overhead and improves privacy.
# Please review the list of services disabled before running the script.

# Privilege Escalation
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

Set-Service OneSyncSvc -StartupType Disabled
Set-Service PcaSvc -StartupType Disabled
Set-Service MessagingService -StartupType Disabled
Set-Service RetailDemo -StartupType Disabled
Set-Service diagnosticshub.standardcollector.service -StartupType Disabled
Set-Service lfsvc -StartupType Disabled
Set-Service DiagTrack -StartupType Disabled
Set-Service MapsBroker -StartupType Disabled

pause
