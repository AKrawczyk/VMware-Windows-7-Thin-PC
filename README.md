# VMware-Windows-7-Thin-PC
VMWare Horizon View Clinet via Windows 7 Thin PC 

# Steps to create a Windows 7 Thin PC

	1. Download Windows 7 Thin PC .iso
	2. Burn DVD of Windows Thin PC .iso
	3. Install Windows
	4. Create login Account
		a. Username = setup
		b. Password = setup
		c. Make sure 'setup' user account password is set to never expire
	5. Login to 'setup' account
	6. Perform Windows Updates
	7. Download Horizon View Client latest version
	8. Install Horizon View Client
	9. Modify Horizon View images with branding
		a. C:\program files\vmware\Vmware Horizon Client\rc
	10. Modify the following registry entries
		a. HKLM -> Software -> Vmware, Inc. -> Vmware VDM -> Client
			i. Add String 'EnableShade'
			ii. Value 'false'
	11. Modify local Group Policy
		a. Gpedit.msc
		b. User Configuration -> Administrative Templates -> System -> Ctrl+Alt+Del Options
			i. Enable all
		c. User Configuration -> Administrative Templates -> System -> Start Menus and Taskbar
			i. Enable ' Remove and provent access to the Shut Down, Restart, Sleep and Hibernate commands
		d. Computer Configuration -> Administrative Templates -> System -> Logon
			i. Enable 'Hide entry points for Fast User Switching'
			ii. Enable 'Always use classic logon'
	12. Enable RDP
	13. Download ThinPC auto login scripts
		a. Installation Instructions
			i. Make sure to place the "JCOS" folder at the root of the C drive, this is very important!
			ii. Check the file "launchview.vbs" and make any changes to file paths that are needed.
			iii. Check the file "InstallJCOS.cmd" and make sure the Windows Activation Key is correct.
	14. Download Sysprep configuration files
		a. Sysprep instructions
			i. Copy "unattend.xml" to c:\windows\system32\sysprep
			ii. Create folder in c:\windows\setup called 'scripts'
			iii. Copy "SetupComplete.cmd" to c:\windows\setup\scripts
			iv. Right click on "cmd" abd Run as Administrator
			v. Goto c:\windows\system32\sysprep
			vi. Enter "sysprep /generalize /oobe /shutdown /unattend:c:\windows\system32\sysprep\unattend.xml
	15. Allow the PC to shutdown.
	16. Image the PC to WDS

# Steps to Update a Windows 7 Thin PC
	1. Download hiren's.bootcd.15.2.iso
	2. Burn to CD/DVD
	3. Boot Windows 7 Thin PC to CD
	4. Select 'Mini XP' from boot menu
	5. Start -> Run
		a. Regedit
		b. Click on HKEY_USER
		c. File -> Load Hive
			i. Choose Drive letter of  Windows 7 Thin PC
			ii. \users\user
			iii. Ntuser.dat
			iv. Name = user
			v. [HKEY_User\user\Software\Microsoft\wWndows NT\CurrentVersion\Winlogon]
			vi. Delete "shell"
	6. Reboot PC
	7. PC Auto logs in to "user" account
		a. Run Windows Updates
		b. Download and install latest VMware Horizon View Client
		c. Run "Regedit"
			i. Goto [HKLM_Local_Machine]\System\Setup\
			ii. Delete 'Update' key
			iii. Delete 'Update' folder
			iv. Goto [HKLM_Local_Machine]\System\Setup\Status\SysprepStatus\
			v. Set 'Cleanup State' to 7
			vi. Set 'GeneralizationState' to 7
			vii. Goto [HKEY_Local_Machine]\software\Microsoft\Windows NT\CurrentVersion\Winlogon]
			viii. Delete 'DefaultUserName' string 'user'
			ix. Delete 'DefaultPassword' string 'user'
			x. Delete 'AutoAdminLogon' value '1'
			xi. Delete 'ForceAutoLogon' value '1'
		d. Right Click "cmd" and Run as Administrator
			i. Slmgr /upk (This clears the licence key and deactivates Windows)
	8. Log off
	9. Logon to 'setup' account
		a. Right click 'Computer' -> Manage
		b. Delete 'user' logon account
		c. Make sure 'setup' user account password is set to never expire
		d. Right click 'Computer' -> Properties
		e. Click 'Advanced System Settings' -> 'User Profiles' -> 'Settings…'
		f. Delete 'UNKNOW Accounts'
	10. Download Sysprep configuration files
		a. Sysprep instructions
			i. Copy "unattend.xml" to c:\windows\system32\sysprep
			ii. Create folder in c:\windows\setup called 'scripts'
			iii. Copy "SetupComplete.cmd" to c:\windows\setup\scripts
			iv. Right click on "cmd" abd Run as Administrator
			v. Goto c:\windows\system32\sysprep
			vi. Enter "sysprep /generalize /oobe /shutdown /unattend:c:\windows\system32\sysprep\unattend.xml
		b. Allow the PC to shutdown.
		c. Image the PC to WDS

# Steps After WDS Deploy
	1. Enter the PC name 
	2. Login to 'setup' account
		a. Auto logon scripts run
		b. Right Click "Computer"
			i. check windows activation
		c. If Auto login script do not run
			i. Go to c:\joc
			11. Run "InstallJCOS.cmd"
