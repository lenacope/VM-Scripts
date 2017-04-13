Restore-VMSnapshot -ComputerName BB-8.grantadesign.local -Name "PS Essentials" -VMName "CES Win10 Auto" -Confirm:$false
Start-VM -ComputerName BB-8.grantadesign.local -VMName "CES Win10 Auto"
#Select best command to use from One note & check bookmarked blog
Do {Start-Sleep -milliseconds 100} Until((Get-VM -ComputerName BB-8.grantadesign.local -VMName "CES Win10 Auto").Heartbeat -eq 'OkApplicationsHealthy')
Start-Sleep -s 120
# TC will later copy this from the build it is running
copy-item -Path “\\teamcity\artifacts\CesNext_Installation_Deployment\6. Burn installer\973999\master\Installation\Files” -Destination \\CES-WIN10-AUTO\Deployment -Recurse -Force
#these files will be checked out of source control
copy-item -Path \licence.xml -Destination \\CES-WIN10-AUTO\Deployment\Files -Recurse -Force
copy-item -Path \licence.xml -Destination \\CES-WIN10-AUTO\Deployment\Files -Recurse -Force
copy-item -Path \InstallRunCES.ps1 -Destination \\CES-WIN10-AUTO\Scripts -Recurse -Force
copy-item -Path \reportprocess.ps1 -Destination \\CES-WIN10-AUTO\Scripts -Recurse -Force
copy-item -Path \OpenCES.ces -Destination \\CES-WIN10-AUTO\Scripts -Recurse -Force
C:\pstools\psexec \\ces-win10-Auto -i -s PowerShell C:\Scripts\InstallRunCES.ps1
#Installs, Runs CES, copies results back to build agent 


#copy-item -Path \\ceswin10\test\test.txt -Destination \\lenac\test -Recurse -Force - this command works if the network works
Stop-VM -ComputerName BB-8.grantadesign.local -VMName "CES Win10 Auto"


#psexec troubleshooutng
#psexec -i \\127.0.0.1 C:\Windows\notepad.exe >C:\buffer.dat 2\&1
#C:\pstools\psexec \\ces-win10-Auto -i -s C:\Windows\notepad.exe >C:\buffer.dat 2\&1
#C:\pstools\psexec \\ces-win10-Auto -i -s PowerShell C:\Scripts\InstallrunCES.ps1 >output.txt 2>&1 # resolved vertion that writes an output to a file in C:\windows\system32

#works
#copy-item -Path “\\teamcity\artifacts\CesNext_Installation\Full Installer (EduPack)\899152\Installation\Files” -Destination \\CES-WIN10-AUTO\Deployment -Recurse -Force