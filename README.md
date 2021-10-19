**Windows Insider Program Enroller (Insider_Enroller)**
----------------------------------------------------------
**Insider_Enroller v2.0.0**
-----------------------------------

### Description
Insider_Enroller is Command Prompt script to enable access to the Windows Insider Program to Windows 10/11 Users without Microsoft Account

--------------------
This script is compatible only with Windows 10 v1903 and later(Windows 10 2019 May Update) and Windows 11.

---------------------------------------------------------------------------------------------------------------------------------
### Usage
This Script requires Administrator Rights to Run

-----
To Run it as Administrator 

-----
Right Click the file and select **`Run as Administrator`** Option.
[![](https://drive.google.com/uc?export=view&id=15Vb4xFaud1a5s8yseIBcsF0VXo2PPCOk)](https://google.com)

[![](https://drive.google.com/uc?export=view&id=15_HYkXHeT5K9_YU_h-9JwFqkpmFD9DKU)](https://google.com)


-------

##### Note:
If you are on __Windows 10 or Windows 11 in an Officially Supported System__ Make sure to Run **`Insider_Enroller_W10_W11.cmd`**

---------
If you are on __Windows 11 in an Officially Unsupported System__ Make sure to Run **`Insider_Enroller_UnSupported_PCs.cmd`**


#### Enrollment of Windows Insider Programs
If you run the script it will open up a Command prompt Window
In that Window you will see Below Text

` Insider_Enroller v2.0.0`

--------------------------------
 
`1 - Enroll to Dev Channel`

---
`2 - Enroll to Beta Channel`

---
`3 - Enroll to Release Preview Channel`

---
`4 - Stop receiving Insider Preview builds`

---
`5 - Quit without making any changes`

---

**You have to Select the number that suit your need**
*`Select 1 if you want to Enroll to Dev channel`*

---
*(Note: Dev channel updates may not apply in Unsupported Pcs due to compatiblity)*

---
*`Select 2 If you want Beta Channel`*

---
*(Note: Beta channel updates may not work without required bypass)*

---
*`Select 3 If you want Release Preview Channel`*

---
*(Note: Release Preview channel updates may not work without required bypass)*

---
*`Select 4 If you want to leave Windows Insider Program`*

---
*(This will leave Windows Insider Program and offer Stable Updates)*

---
*`Select 5 To Exit the Script Without Making Any Changes To your System`*

---

If the machine was not enrolled to the Insider Program, you will get prompted to restart 

----
To enable *Microsoft Flight Signing* which is required by **`Windows Insider Program`**

---
##### **Note:** Windows Insider Program requires telemetry to be set to ***`Required + Optional` or `Full` in Older Windows 10 Versions* in Order to receive Windows Insider Preview Builds**.

---
After enrolling your machine to the **`Windows Insider Program`** please make sure that your diagnostic data collection settings are set to **Required + Optional or Full in Older Windows 10 Versions**.

----
Some *Windows Insider Preview* builds may not be offered in **`Windows Update`** if you do not have correct telemetry settings.

-----------
You can verify or modify your telemetry settings in
**`Settings`** > **`Privacy and Security`** > **`Diagnostics & feedback`** in **Windows 11**

------
**`Settings`** > **`Privacy`** > **`Diagnostics & feedback`** in **Windows 10**.

-------

#### Returning Back to Stable Updates
To restore *Windows Insider Program* to default settings simply choose `Stop receiving Insider Preview builds` in `Insider_Enroller`. 

---------------
You will get prompted to reboot, because this option will disable **Microsoft Flight Signing**.

---------------------------------------------------------------------------------------------------------------------------------
### How does this work?
This script takes advantage of undocumented `TestFlags` Registry values.
This Script can set its own **Windows Insider Preview** configuration without being overriden by the contact to the service.

-----------------------------------------------
Since Windows Update does not check if machine is actually enrolled to the program, you will get offered **Insider Preview builds** by just setting correct values in the Registry Editor.

------------------------------------------------
##### Note
**Do not Edit `Registry Editor` without prior knowledge** the Script will do the thing for you

--------------------------------------------------------------------------
If you Modify `Registory Editor` without prior knowledge your PC will go into `BSOD`(Blue Screen of Death in **Windows 10** or Black Screen of Death in **Windows 11**) 

-------------------------------------------
maybe `GSOD`(Green Screen of Death in Windows Insider Channel Builds from `22449.1000`)

--------------------------------------
##### This will come handy when ...
This Script will become Handy when you are going to update your PC to Windows 11 but you don't have a Supported PC just select Enroll to Beta Channel and This automatically update your system

---------------------------------------------------------------------------------------------------------------------------------

### How Does this Script works on Unsupported PCs for Windows 11
This Scripts disables/bypasses `Windows 11` **`TPM`**, **`Secure Boot`**, **`RAM`** and **`Processor`** Check to Install `Windows 11` in a Unsupported PCs

##### Note
This Script uses Microsoft Recommended way and other popular ways to Bypass this to see what this Script Changes in your registry see `Registry_Changes.md` File

---------------------------------------------------------------------------------------------------------------------------------
### About Windows Insider Program Channels
Continue to `Channels.md` File

---------------------------------------------------------------------------------------------------------------------------------
### License
See `License` File for More Details

---------------------------------------------------------------------------------------------------------------------------------

### Inspiration and Idea
>This Script is made using **`OfflineInsiderEnroll v2.6.2`**
**I have added its License File to the code**
