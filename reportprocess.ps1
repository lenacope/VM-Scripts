	$target = "ces"
	$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
	while (!($process))
	{
	start-sleep -s 5
    $process = Get-Process | Where-Object {$_.ProcessName -eq $target}
	}
	Add-Content 'c:\scripts\results.txt' 'The CES process is running. Just a file to represent the nunit file that will be copied back'
	#temporary lines just to exit software for now until bug is fixed 
	Start-sleep -s 60
	Stop-Process -processname ces
	Invoke-Command -ScriptBlock{powershell.exe -noprofile -executionpolicy bypass -command "Copy-Item -Path C:\Scripts\results.txt -Destination \\ces-build-1\PS -Recurse -Force"}