# Insider-Enroller for Windows 10 or Windows 11 users without MS Account
------------------------------------------------------------------------

## Table of contents
* [Description](https://github.com/Jathurshan-2019/Insider-Enroller/blob/main/README.md#description)
* [Usage](https://github.com/Jathurshan-2019/Insider-Enroller/blob/main/README.md#usage)
* [Installation](https://github.com/Jathurshan-2019/Insider-Enroller/blob/main/README.md#installation-and-configuration-changes)
  * Notice
* [Restoration](https://github.com/Jathurshan-2019/Insider-Enroller/blob/main/README.md#restoring-windows-insider-program-to-default-options)
* [License](https://github.com/Jathurshan-2019/Insider-Enroller/blob/main/README.md#license)
* [Insipiration and Idea](https://github.com/Jathurshan-2019/Insider-Enroller/blob/main/README.md#inspiration-and-idea)

### Description
InsiderEnroller is a simple Windows Command Prompt script to enable access
to the Windows Insider Program on machines not signed in with Microsoft Account.

This script is compatible only with Windows 10 2018 October update and later(This is also Compatible with Windows 11).

### Usage
This script requires administrative priviliges to run. You can simply execute it
by right clicking it > **`Run as Administrator`**.

#### Installation and configuration changes
After starting the script offers selection of *Windows Insider Program* channels.
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
**Settings** > **Privacy and Security** > **Diagnostics & feedback** in Windows 11 and **Settings** > **Privacy** > **Diagnostics & feedback** in Windows 10.

#### Restoring Windows Insider Program to default options
To restore *Windows Insider Program* to default settings simply choose `Stop Receving Preview Builds From your Insider Channel` in `InsiderEnroller`. You will get prompted
to reboot, because this option will disable **Microsoft Flight Signing**.

### How does this work?
This script takes advantage of undocumented `TestFlags` registry value.
If this value is set to `0x20`, all access to online **Windows Insider** services
gets disabled. Because of this, we can set our own **Windows Insider Preview**
configuration without being overriden by the contact to the service. Since
Windows Update does not check if machine is actually enrolled to the program,
you will get offered **Insider Preview** builds by just setting correct values in
the registry.

### License
This project is licensed under the **`MIT License, Apache 2.0 License and GNU 3.0`**. See **`LICENSE`** for details.

### Inspiration and Idea
This Script is made using **`OfflineInsiderEnroll v2.5.0`**
**I have added its License File to the code**



[License Files]
[MIT License](https://drive.google.com/file/d/197rROuFe5WP6m8-oPHcbC45X8DI73-LM/view?usp=sharing) /
[OfflineInsiderEnroll MIT License](https://drive.google.com/file/d/1FDWD-L1M-23MoQ5iGPUQOZtcogI_6MV_/view?usp=sharing) /
[Apache 2.0 License](https://drive.google.com/file/d/1MAAUzYJrW6e15n1EWkNo8jvkza6edA5B/view?usp=sharing) /
[GNU License](https://drive.google.com/file/d/1hNbwGzT5EkmZL0AvHHIagwyGFaj0og03/view?usp=sharing)
