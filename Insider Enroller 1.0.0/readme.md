InsiderEnroller without MS Account
---------------------------------

### Description
InsiderEnroller is a simple Windows Command Prompt script to enable access
to the Windows Insider Program on machines not signed in with Microsoft Account.

This script is compatible only with **Windows 10 v1903 and later. Including Windows 11**.

### Usage
This script requires administrative priviliges to run. You can simply execute it
by right clicking it > **`Run as Administrator`**.

#### Installation and configuration changes
After starting the script offers selection of __*Windows Insider Program*__ channels.
To make a selection, press a letter coresponding to option you choose and press
ENTER.

If the machine was not enrolled to the Insider Program, you will get prompted to
restart your machine to enable *Microsoft Flight Signing* which is required by
**`Windows Insider Program`**.

**Notice:** Windows Insider Program requires telemetry to be set to *Full*.
After enrolling your machine to the **Windows Insider Program** please make sure
that your diagnostic data collection settings are set to **Full**. Some *Insider
Preview* builds may not get offered in **Windows Update** if you do not have
correct telemetry settings. You can verify or modify your telemetry settings in
*Settings* > *Privacy and Security* > *Diagnostics & feedback* __in Windows 11__ and *Settings* > *Privacy* > *Diagnostics & Feedback* __in Windows 10__.

#### Restoring Windows Insider Program to default options
To restore *Windows Insider Program* to default settings simply choose `Stop receiving Insider Preview builds` in `Insider-Enroll Script`. You will get prompted
to reboot, because this option will disable *`Microsoft Flight Signing`*.

### How does this work?
This script takes advantage of undocumented `TestFlags` registry value.
If this value is set to `0x20`, all access to online *`Windows Insider`* services
gets disabled. Because of this, we can set our own **Windows Insider Preview**
configuration without being overriden by the contact to the service. Since
`Windows Update` does not check if machine is actually enrolled to the program,
you will get offered **Insider Preview** builds by just setting correct values in
the registry.

### License
This project is licensed under the MIT License and Apache 2.0 License. See **`LICENSE`** for details.
