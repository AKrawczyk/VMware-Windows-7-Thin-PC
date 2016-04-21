regedit.exe /s C:\JCOS\JCOS-2.reg
c:\windows\system32\gpupdate.exe /force
net localgroup administrators /remove user
C:\JCOS\shutdown.exe -r -t 60 -f -c "Now rebooting - You are moments away from Thin Client awesomeness"