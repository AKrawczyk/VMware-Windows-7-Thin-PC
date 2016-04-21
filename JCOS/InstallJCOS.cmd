@rem JCOS Installer Script
@rem by James Cuadros

@rem Add a user called "user" with the password "user"
net user user user /ADD /PASSWORDCHG:NO /FULLNAME:"VMware View User"
net localgroup administrators /add user

@rem Add the following registry key changes:
regedit /s C:\JCOS\JCOS-1.reg
@rem This allows the user account to auto login. Log in as local Administrator by holding the Shift key when logging out

cscript //b c:\windows\system32\slmgr.vbs /ipk xxxxx-xxxxx-xxxxx-xxxxx-xxxxx
cscript //b c:\windows\system32\slmgr.vbs /ato

@rem Reboot the system to modify the user account shell.
C:\JCOS\shutdown.exe -r -t 60