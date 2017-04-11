Invoke-Command -ScriptBlock{powershell.exe -noprofile -executionpolicy bypass -command "cmd.exe /c C:\Deployment\Files\edupack_setup.2017.exe /s /q"}
#before opening the project file check for insterler process terminated - is this really necessary?
$target = "edupack_setup.2017"
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
while ($process)
{
    start-sleep -s 5
    #will this exit logic work
    $process = Get-Process | Where-Object {$_.ProcessName -eq $target}
}

Invoke-Item C:\Scripts\OpenCES.ces
& ((Split-Path $MyInvocation.InvocationName) + "\reportprocess.ps1")