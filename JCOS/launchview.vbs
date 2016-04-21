set shell = CreateObject("WScript.Shell")
set fs = CreateObject("Scripting.FileSystemObject")
Dim cmdView, cmdDel
cmdView=" --desktopLayout fullscreen --serverURL oadesktop.citonline.ie --connectUSBOnStartup true --connectUSBOnInsert true --SingleAutoConnect"
cmdDel=shell.expandenvironmentstrings("%APPDATA%")
'Launch the View client and wait for it to close
WScript.Sleep 5000
shell.run  """C:\Program Files\VMware\VMware Horizon View Client\vmware-view.exe""" & cmdView,,1
'Logout of the ThinPC
shell.run "shutdown /l"
set shell = Nothing
fs.DeleteFile(cmddel & "\VMware\VMware Horizon View Client\prefs.txt")