
**Dev Channel**
-----------

## Recommended Users
This Channel is Recommended for **`Developers`** and **`Early Adopters`** and **`Highly Technical users`**

## Why?
Because this Channel contains the code that is in **early stage of development** so this **may contain severe bugs, errors and this build is more instable**

## Benefits
Users will get **more ahead builds** than other users
Users will get **New features and first access to those features**

## Disadvantages
These builds are **more instable** due to that your **PC may crash**
May generate **GSOD(Green Screen of Death)** also


**Beta Channel**
--------------

## Recommended Users
This Channel is recommended for **`Personal Users`**

## Why?
Because this Channel contains the code that is **tested on `Dev Channel` and tested by `Microsoft` only**
So this Channel **may contain small bugs, errors and this build is more stable than `Dev Channel`**

## Benefits
Users will get **upcoming feature update but earlier than Normal Users**
Tested Features in `Dev channel` **will be implemented in** **`Beta Channel`**

## Disadvantages
These Builds are **more stable than `Dev Channel`** **but not as Stable as `Normal Windows build`** so your **PC may crash sometimes if you run heavy software or do heavy work**
Sometimes this Build may generate **GSOD(Green Screen of Death)**

**Release Preview Channel**
---------------------------

## Recommended Users
This Channel is Recommended for `Enterprise` and `Business Users`

## Why?
Because this channel is most stable channel in Windows Insider Preview
This may contain bugs in new features that are included from Beta Channel

## Benefits
Users will get **Upcoming feture update but 2 or 3 weeks before Normal Users**
Tested Features from `Beta Channel` and `Dev channel` will be implemented in `Release Preview Channel`

## Disadvantages
There are no disadvantages because this build is mostly created for business users

Current Builds in Windows Insider Channel
-----------------------------------------

### Dev Channel
Latest Build in Windows 10 Dev Channel = 21390.2025(KB5004123)[Windows 10 build with most of Windows 11 features except UI/UX of Windows 11]
Latest Build in Windows 11 Dev Channel = 22478.1012(KB5007328)[Windows 11]

### Beta Channel
Latest Build in Windows 10 Beta Channel = 19043.1081 (KB5003690)[21H1]
Latest Build in Windows 11 Beta Channel = 22000.282[Windows 11]

### Release Preview Channel
Latest Build in Windows 10 Release Preview Channel = 19044.1263 (KB5005611)[21H2]
Latest Build in Windows 11 Release Preview Channel = 22000.282[Windows 11]

Release Notes
----------------

### Dev Channel 
`Windows 11 22478.1012`

#### New Fluent Emoji
Back in July, the Microsoft Design Team announced refreshed and new Fluent-designed emoji that would roll out across all of Microsoft 365 – including Windows. We are excited to be giving Windows Insiders a “first look” at how our new emoji design will look in Windows 11 starting with today’s Dev Channel build.

New and refreshed emoji as they appear in the emoji panel in Windows 11.

To check out the new emoji, just open up the emoji panel (WIN + . )!

After previewing these with Windows Insiders, we plan to bring these new emoji to everyone on Windows 11 via a future servicing update.

#### Changes and Improvements

----------------------------------
##### The updated version of the Korean IME, which began rolling out with Build 22454, is now available to everyone in the Dev Channel.

------------------------
##### When your laptop is closed, it’s now possible to login to your PC using Facial Recognition (Windows Hello) on a connected external monitor if it has a camera attached that supports it.

---------
##### We’ve made a change to the underlying indexer platform to help improve overall reliability and database size, which should help reduce disk space usage on the system – particularly in cases where users had very large Outlook mailboxes.

-------
##### Scrolling your mouse wheel on the volume icon in the Taskbar will now change the current volume level.

-----------
##### Made some small adjustments to the dialog when adding a new language in Settings to make it look a little more modern, including rounding the corners.

------------------

### Dev Channel
`Windows 10 21390.2025`

#### Changes and Improvements
##### The Internet Explorer 11 desktop application is now retired as of this Insider Preview build. For additional details see https://aka.ms/IEmodeblog.
##### We are turning off the “Eco mode” feature in Task Manager in order to refine the experience and address several issues thanks to Windows Insider feedback.

### Beta Channel
`Windows 11 22000.282 `

#### Bug Fixes
##### Very first Biggest bug fix update for Windows 11

------------------------------------------
##### We fixed an L3 caching issue that might affect performance in some applications on devices that have AMD Ryzen processors after upgrading to Windows 11 (original release).

----------------------------
##### We fixed an issue for a small number of users that prevents the Start menu from working and prevents you from seeing the updated taskbar design after upgrading to Windows 11 (original release).

----------------------------
##### We fixed a race condition that occurs during the early part of startup that might cause a stop error.

----------------------------
##### We fixed a regression that might cause stop error 0x38 on some machine configurations that use non-ASCII text in the registry.

----------------------------
##### We fixed an issue with the interrupt handling of certain processors that might cause devices to stop responding.

----------------------------
##### We fixed an issue that causes PowerShell to create an infinite number of child directories. This issue occurs when you use the PowerShell Move-Item command to move a directory to one of its children. As a result, the volume fills up and the system stops responding.

----------------------------
##### We fixed an issue that causes the Server Manager application to disappear after you use it to remove Hyper-V features. This issue occurs when you install Server Manager on Windows 11 (original release) clients using Remote Server Administration Tools (RSAT).

----------------------------
##### We fixed a threading issue that might cause the Windows Remote Management (WinRM) service to stop working when it is under a high load.

----------------------------
##### We fixed an issue that causes the Windows Management Instrumentation (WMI) provider host process to stop working. This occurs because of an unhandled access violation that occurs when using the Desired State Configuration (DSC).

----------------------------
##### We fixed an issue that causes a device to stop responding when you forcibly shut down the device while a Group Policy is being updated.

----------------------------
##### We fixed an issue that causes file migration between Distributed File System (DFS) paths that are stored on different volumes to fail. This issue occurs when you implement the migration using PowerShell scripts that use the Move-Item command.

----------------------------
##### We fixed an issue that prevents you from writing to a WMI repository after a low memory condition occurs.

----------------------------
##### We fixed an issue with a hardcoded font in the PowerShell shortcut file that distorts Japanese, Chinese, and Korean language fonts. This update fixed this issue for all newly created users on the machine. Existing users can use the C:\Users\Default\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk file to open PowerShell to address the issue. Alternatively, existing users can create a shortcut to this file on the desktop and use the shortcut to open PowerShell.

----------------------------
##### We fixed an issue with parsing time formats in events when milliseconds are excluded.

----------------------------
##### We fixed an issue that incorrectly renders some Enhanced Metafile Format (EMF) files. This issue occurs if you build the EMF files using third-party applications with ExtCreatePen() and ExtCreateFontIndirect().

----------------------------
##### We provided administrators the option to reset the zoom to the default for HTML dialogs in Microsoft Edge Internet Explorer mode.

----------------------------
##### We fixed an issue with Enterprise Mode Site List redirection from Internet Explorer 11 to Microsoft Edge. In certain circumstances, the redirection opens a site in multiple tabs in Microsoft Edge.

----------------------------
##### We fixed an issue that causes Internet Explorer to stop working when you input certain characters in the Input Method Editor (IME).
##### We fixed an issue with PropertyGet in JScript9.dll.

----------------------------
##### We fixed a memory leak that occurs when you use nested classes within VBScript.

----------------------------
##### We fixed an issue that fails to keep the NumLock state after a Fast Startup restart.

----------------------------
##### We fixed an issue with moving certain app windows. Moving these app windows might be unusually slow if a File Explorer window is visible on the screen.

----------------------------
##### We fixed an issue that intermittently prevents the Mail app from accepting keyboard input in the address and subject boxes.

----------------------------
##### We fixed an issue with the UI for renaming files using folder view in File Explorer. The UI fails to properly handle inline composition using the new Japanese IME.

----------------------------
##### We fixed an issue in which the use of App-V intermittently causes black screens to appear when signing in on the credentials page.

----------------------------
##### We fixed an issue with an internet print server that fails to properly package modified printer properties before sending the package to the client.

----------------------------
##### We implemented a Group Policy setting for the following registry value (For more information, see KB5005010):
Registry location: HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint

Value name: RestrictDriverInstallationToAdministrators

Value data: 1


----------------------------
##### We fixed an issue that might cause Xbox Game Bar recording features to be unavailable.

----------------------------
##### We fixed an issue that might cause distortion in the audio captured by voice assistants.

----------------------------
##### We fixed an issue that causes a memory leak in lsass.exe when the pTokenPrivileges buffer is not released.

----------------------------
##### We fixed an issue that might cause Kerberos.dll to stop working within the Local Security Authority Subsystem Service (LSASS).

---------------------------- This occurs when LSASS processes simultaneous Service for User (S4U) user-to-user (U2U) requests for the same client user.

----------------------------
##### We fixed an issue with a non-paged pool (NPP) leak from the UxSF pool tag. This leak occurs when lsass.exe stops processing asynchronous Security Support Provider Interface (SSPI) calls.

----------------------------
##### We fixed an issue that prevents you from enabling BitLocker on a thinly provisioned virtual machine (VM). The error is “A device attached to the system is not functioning” and the system logs, “STATUS_UNSUCCESSFUL”.

----------------------------
##### We improved the performance of MsSense.exe in environments with User Datagram Protocol (UDP) applications that require high amounts of bandwidth.

----------------------------
##### We fixed an issue in Windows Defender Exploit Protection that prevents some Microsoft Office applications from working on machines that have certain processors.

----------------------------
##### We enabled credentials for Azure Active Directory (Azure AD) Active Directory Federation Services (ADFS) users in Quick Assist.

----------------------------
##### We fixed an issue that sometimes prevents Quick Assist users from using full screen view after they start a remote assistance session.

----------------------------
##### We fixed an issue in which Set-RDSessionCollectionConfiguration does not set the camerastoredirect:s:value custom property.

----------------------------
##### We fixed an IME mode instability in the RemoteApp scenario. You must install this update on the Remote Desktop server and Remote Desktop client.

----------------------------
##### We fixed an issue that causes the IME toolbar to appear even when the RemoteApp is closed.

----------------------------
##### We fixed a paged pool memory leak of the registry keys for the Virtual Desktop ID that occurs in explorer.exe.

----------------------------
##### We made small adjustments to the contrast theme colors, such as making hyperlinks more distinct when you hover over them while you are using the desert theme.

----------------------------
##### We fixed an issue that prevents Narrator and other screen readers from announcing when the Start menu is open in certain cases.

----------------------------
##### We fixed an issue that occurs if the search index is damaged in certain ways; attempts to search using the taskbar or File Explorer fail.

----------------------------
##### We fixed an issue that prevents the search window from appearing on a secondary monitor.

----------------------------
##### We fixed an issue that might cause the File Explorer window to lose focus when you map a network drive.

----------------------------
##### We fixed an issue that sometimes causes the lock screen to appear black if you set up slideshow.

----------------------------
##### We fixed a reliability issue with LogonUI.exe, which affects the rendering of the network status text on the credentials screen.

----------------------------
##### We fixed an issue that prevents you from opening multiple instances of an app using Shift and clicking on the app’s icon in the taskbar.

----------------------------
##### We updated the visual design and animations of the Chat icon on the taskbar.

----------------------------
##### We removed the warning about losing other people’s unsaved work when shutting down or restarting if no other users are signed in.

----------------------------
##### We fixed an issue that might occur when you configure the policy, “Delete user profiles older than a specified number of days on system restart”. If a user has been signed in for longer than the time specified in the policy, the device might unexpectedly delete profiles at startup.

----------------------------
##### We fixed an issue that fails to establish a connection to the Remote Desktop Protocol (RDP) service or immediately drops an RDP connection under certain circumstances.

----------------------------
##### We fixed an issue that might cause input delays for certain Bluetooth mice and keyboards.

----------------------------
##### We fixed an issue that prevents the Start menu from opening after a video driver upgrade.

----------------------------
##### We improved the precision of the estimates for downtime when the estimates are at least two minutes or more.

----------------------------
##### We fixed a Local Security Authority Subsystem Service (LSASS) domain controller memory leak that is reported in Privileged Access Management (PAM) deployments.

----------------------------
##### We fixed an issue that occurs when the Lightweight Directory Access Protocol (LDAP) bind cache is full, and the LDAP client library receives a referral.

----------------------------
##### We fixed an issue in Adamsync.exe that affects the syncing of large Active Directory subtrees.

----------------------------
##### We fixed an issue that causes a deadlock when Offline Files are enabled. As a result, CscEnpDereferenceEntryInternal holds parent and child locks.

----------------------------

### Windows 10 Beta Channel
Windows 10 21H1

#### This build has been rolled out to stable build

### Windows 11 Release Preview Channel
Windows 11 22000.282

#### See Windows 11 Beta Build 22000.282

### Windows 10 Release Preview Channel
Windows 10 21H2 19044.1263

We fixed an issue that changes the device’s current UI language. This occurs during an unattended out-of-box experience (OOBE) language pack installation scenario on a desktop.

-------
We fixed an issue that causes the system time to be incorrect by one hour after a daylight saving time (DST) change.

-------
We fixed an issue that causes the Server Manager application to disappear after you use it to remove Hyper-V features on Windows Server 2022.

-------
We fixed an issue with parsing time formats in event logs. This issue occurs when you exclude milliseconds.

-------
We fixed an issue that causes the DnsCache service to increase the CPU usage to 100% utilization. As a result, the device stops responding.

-------
We provided administrators the option to reset the zoom to the default for HTML dialogs in Microsoft Edge Internet Explorer mode.

-------
We fixed an issue that stops calls to the Windows Image Acquisition (WIA) minidriver for Windows Portable Devices (WPD) devices that you access using WIAMgr.

-------
We fixed an issue that causes applications, such as Microsoft Outlook, to suddenly stop responding during normal use. This occurs if the application created and removed UI elements on a background thread that is no longer receiving messages.

-------
We fixed an issue with the Microsoft Outlook Add-in that prevents you from providing input after you select Reply.

-------
We fixed an issue that fails to keep the NumLock state after a Fast Startup restart.

-------
We fixed an issue with sharing a screen using Microsoft Teams. Protected content, such as a digital rights management (DRM) email, appears black for the presenter, but appears transparent for everyone else.

-------
We fixed an issue that might prevent drawing on the screen using Windows Context::UpdateRgnFromRects from working.

-------
We fixed an issue that might cause distortion in the audio that Cortana and other voice assistants capture.

-------
We removed the limitation of 25 maximum Traffic Selectors in the Windows native Internet Key Exchange (IKE) client and server.

-------
We fixed an issue that fails to display the smart card PIN dialog when you are connected to a virtual private network (VPN). This issue occurs after upgrading to Windows 10, version 2004.

-------
We fixed an issue that causes a memory leak in lsass.exe when the pTokenPrivileges buffer is not released.

-------
We fixed an issue with a non-paged pool (NPP) leak from the UxSF pool tag. This leak occurs when lsass.exe stops processing asynchronous Security Support Provider Interface (SSPI) calls.

-------
We fixed an issue that prevents the xhunter1.sys driver from loading. As a result, some games cannot run when you enable Hypervisor-Protected Code Integrity (HVCI).

-------
We fixed an issue that causes Windows to stop working if you deploy a Code Integrity policy without user mode rules.

-------
We improved the performance of MsSense.exe in environments with User Datagram Protocol (UDP) applications that require high amounts of bandwidth.

-------
We fixed an input method editor (IME) mode instability in the RemoteApp scenario. You must install this update on the Remote Desktop server and Remote Desktop client.

-------
We fixed an issue that causes blurry News and interests icons when you use certain screen resolutions.

-------
We fixed a paged pool memory leak of the registry keys for the Virtual Desktop ID that occurs in explorer.exe.

-------
We fixed an issue that causes LogonUI.exe to stop working because Direct Manipulation fails to start.

-------
We fixed an issue that causes News and interests to appear in the context menu even when you have disabled it on a device.

-------
We fixed an issue that causes the configuration for multiple artifact DB support across datacenters to fail for Security Assertion Markup Language (SAML) artifacts.

-------
We fixed an issue that causes the LsaLookupSids() function to fail. This occurs when there are security identifiers (SID) for users that no longer exist in a group that contains cross-domain trusted users.

-------
We fixed an issue that fails to apply the post_logout_redirect_uri= parameter when you use an External Claims Provider.

-------
We fixed an issue with a deadlock in the WebDav redirector that occurs when it attempts to read a file from the local TfsStore. As a result, the system stops responding.

-------
We fixed an issue that causes a stop error after a restart.

-------
We fixed an issue with Enterprise Mode Site List redirection from Internet Explorer 11 to Microsoft Edge. In certain circumstances, the redirection opens a site in multiple tabs in Microsoft Edge.

-------
We removed a hyperlink that might cause the Input app to stop working when you first enter fuzzy pinyin content.

------------------
We fixed an activation issue for the Input application.

------------------
We fixed an issue that causes apps to lose focus when the taskbar is not at the bottom of the screen.

------------------
We fixed an issue that always reports the update build revision (UBR) as zero (0) on a device during enrollment to mobile device management (MDM) service.

------------------
We fixed an issue with PropertyGet in JScript9.dll.

------------------
We implemented a Group Policy for the registry key below:
Key: HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint
Value: RestrictDriverInstallationToAdministrators

------------------

## Go to the Script and Run it as Admnistrator