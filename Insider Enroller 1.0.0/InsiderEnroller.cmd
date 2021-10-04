@echo off
::Made By Jathurshan 
for /f "tokens=6 delims=[]. " %%i in ('ver') do set build=%%i

if %build% LSS 17763 (
    echo ==--------------------------------------------------------------------------------------==
    echo   This script is compatible only with Windows 10 2018 October Update and with Windows 11.
    echo ==--------------------------------------------------------------------------------------==
    echo.
    pause
    goto :EOF
)

REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1
IF %ERRORLEVEL% EQU 0 goto :START_SCRIPT

echo =---------------------------------------------------=
echo This script needs to be executed as an administrator.
echo =---------------------------------------------------=
echo.
pause
goto :EOF

:START_SCRIPT
set "scriptver=1.0.0"
set "FlightSigningEnabled=0"
bcdedit /enum {current} | findstr /I /R /C:"^flightsigning *Yes$" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 set "FlightSigningEnabled=1"

:CHOICE_MENU
cls
set "choice="
echo Insider Enroll without MS Account v%scriptver%
echo Apache 2.0 License
echo  
echo Copyright 2021 © of Jathurshan Myuran
echo  
echo Licensed under the Apache License, Version 2.0 (the "License");
echo You must not use this file except in compliance with the License.
echo  
echo Unless required by applicable law or agreed to in writing, software
echo distributed under the License is distributed on an "AS IS" BASIS,
echo WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
echo See the License for the specific language governing permissions and
echo limitations under the License.
echo.
echo This Code made by Jathurshan Myuran From Offline Insider Enroll Code
echo 1 - Enroll your Device to Dev Channel[Very Early least tested code] (Disclaimer: Dev Channel builds have many bugs. This channel is for DEVELOPMENT-USE only)
echo 2 - Enroll your Device to Beta Channel[more tested code than Dev Channel] (Disclaimer: Beta Channel builds have less bugs than Dev channel. This Channel is for GENERAL TESTING-USE)
echo 3 - Enroll your Device to Release Preview Channel[Very well tested code] (Disclaimer: Release Preview Channel builds may have some bugs. This channel is for COMMERCIAL-USE)
echo.
echo 4 - Stop Receving Preview Builds From your Insider Channel
echo 5 - Quit the Script without making any changes to your pc
echo.
set /p choice="Choice: "
echo.
if /I "%choice%"=="1" goto :ENROLL_DEV
if /I "%choice%"=="2" goto :ENROLL_BETA
if /I "%choice%"=="3" goto :ENROLL_REPR
if /I "%choice%"=="4" goto :STOP_INSIDER
if /I "%choice%"=="5" goto :EOF
goto :CHOICE_MENU

:ENROLL_REPR
set "Channel=ReleasePreview"
set "Fancy=Release Preview Channel"
set "BRL=8"
goto :ENROLL

:ENROLL_BETA
set "Channel=Beta"
set "Fancy=Beta Channel"
set "BRL=4"
goto :ENROLL

:ENROLL_DEV
set "Channel=Dev"
set "Fancy=Dev Channel"
set "BRL=2"
goto :ENROLL

:RESET_INSIDER_CONFIG
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Account" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Cache" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\WUMUDCat" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\RingExternal" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\RingPreview" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\RingInsiderSlow" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\RingInsiderFast" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v BranchReadinessLevel /f
goto :EOF

:ADD_INSIDER_CONFIG
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Orchestrator" /t REG_DWORD /v EnableUUPScan /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\RingExternal" /t REG_DWORD /v Enabled /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\WUMUDCat" /t REG_DWORD /v WUMUDCATEnabled /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /t REG_DWORD /v EnablePreviewBuilds /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /t REG_DWORD /v IsBuildFlightingEnabled /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /t REG_DWORD /v IsConfigSettingsFlightingEnabled /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /t REG_DWORD /v TestFlags /d 32 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /t REG_DWORD /v RingId /d 11 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /t REG_SZ /v Ring /d "External" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /t REG_SZ /v ContentType /d "Mainline" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /t REG_SZ /v BranchName /d "%Channel%" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /t REG_SZ /v StickyXaml /d "<StackPanel xmlns="^""http://schemas.microsoft.com/winfx/2006/xaml/presentation"^""><TextBlock Style="^""{StaticResource BodyTextBlockStyle }"^"">This device has been enrolled to the Windows Insider program using Insider-Enroller v%scriptver%. If you want to change settings of the enrollment or stop receiving Insider Preview builds, please use the script. <Hyperlink NavigateUri="^""https://github.com/Jathurshan-2019/Insider-Enroller/blob/main/README.md"^"" TextDecorations="^""None"^"">Learn more</Hyperlink></TextBlock><TextBlock Text="^""Applied configuration"^"" Margin="^""0,20,0,10"^"" Style="^""{StaticResource SubtitleTextBlockStyle}"^"" /><TextBlock Style="^""{StaticResource BodyTextBlockStyle }"^"" Margin="^""0,0,0,5"^""><Run FontFamily="^""Segoe MDL2 Assets"^"">&#xECA7;</Run> <Span FontWeight="^""SemiBold"^"">%Fancy%</Span></TextBlock><TextBlock Text="^""Channel: %Channel%"^"" Style="^""{StaticResource BodyTextBlockStyle }"^"" /><TextBlock Text="^""Content: Mainline"^"" Style="^""{StaticResource BodyTextBlockStyle }"^"" /><TextBlock Text="^""Telemetry settings notice"^"" Margin="^""0,20,0,10"^"" Style="^""{StaticResource SubtitleTextBlockStyle}"^"" /><TextBlock Style="^""{StaticResource BodyTextBlockStyle }"^"">Windows Insider Program requires diagnostic data collection settings to be set to <Span FontWeight="^""SemiBold"^"">Full</Span>. You can verify or modify your current settings in <Span FontWeight="^""SemiBold"^"">Diagnostics &amp; feedback</Span>.</TextBlock><Button Command="^""{StaticResource ActivateUriCommand}"^"" CommandParameter="^""ms-settings:privacy-feedback"^"" Margin="^""0,10,0,0"^""><TextBlock Margin="^""5,0,5,0"^"">Open Diagnostics &amp; feedback</TextBlock></Button></StackPanel>" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /t REG_DWORD /v UIHiddenElements /d 65535 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /t REG_DWORD /v UIDisabledElements /d 65535 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /t REG_DWORD /v UIServiceDrivenElementVisibility /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /t REG_DWORD /v UIErrorMessageVisibility /d 192 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /t REG_DWORD /v AllowTelemetry /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /t REG_DWORD /v BranchReadinessLevel /d %BRL% /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /t REG_SZ /v StickyMessage /d "{"^""Message"^"":"^""Device Enrolled Using Insider-Enroller"^"","^""LinkTitle"^"":"^"""^"","^""LinkUrl"^"":"^"""^"","^""DynamicXaml"^"":"^""<StackPanel xmlns=\\"^""http://schemas.microsoft.com/winfx/2006/xaml/presentation\\"^""><TextBlock Style=\\"^""{StaticResource BodyTextBlockStyle }\\"^"">This device has been enrolled to the Windows Insider program using Insider-Enroller v%scriptver%. If you want to change settings of the enrollment or stop receiving Insider Preview builds, please use the script. <Hyperlink NavigateUri=\\"^""https://github.com/Jathurshan-2019/Insider-Enroller/blob/main/README.md\\"^"" TextDecorations=\\"^""None\\"^"">Github Link to Learn More About Insider-Enroller</Hyperlink></TextBlock><TextBlock Text=\\"^""Applied configuration\\"^"" Margin=\\"^""0,20,0,10\\"^"" Style=\\"^""{StaticResource SubtitleTextBlockStyle}\\"^"" /><TextBlock Style=\\"^""{StaticResource BodyTextBlockStyle }\\"^"" Margin=\\"^""0,0,0,5\\"^""><Run FontFamily=\\"^""Segoe MDL2 Assets\\"^"">&#xECA7;</Run> <Span FontWeight=\\"^""SemiBold\\"^"">%Fancy%</Span></TextBlock><TextBlock Text=\\"^""Channel: %Channel%\\"^"" Style=\\"^""{StaticResource BodyTextBlockStyle }\\"^"" /><TextBlock Text=\\"^""Content: Mainline\\"^"" Style=\\"^""{StaticResource BodyTextBlockStyle }\\"^"" /><TextBlock Text=\\"^""Telemetry settings notice\\"^"" Margin=\\"^""0,20,0,10\\"^"" Style=\\"^""{StaticResource SubtitleTextBlockStyle}\\"^"" /><TextBlock Style=\\"^""{StaticResource BodyTextBlockStyle }\\"^"">Windows Insider Program requires diagnostic data collection settings to be set to <Span FontWeight=\\"^""SemiBold\\"^"">Full</Span>. You can verify or modify your current settings in <Span FontWeight=\\"^""SemiBold\\"^"">Diagnostics &amp; feedback</Span>.</TextBlock><Button Command=\\"^""{StaticResource ActivateUriCommand}\\"^"" CommandParameter=\\"^""ms-settings:privacy-feedback\\"^"" Margin=\\"^""0,10,0,0\\"^""><TextBlock Margin=\\"^""5,0,5,0\\"^"">Open Settings -> Diagnostics &amp; feedback</TextBlock></Button></StackPanel>"^"","^""Severity"^"":0}" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /t REG_DWORD /v UIHiddenElements_Rejuv /d 65534 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /t REG_DWORD /v UIDisabledElements_Rejuv /d 65535 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup" /t REG_DWORD /v AllowUpgradesWithUnsupportedTPMOrCPU /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\WindowsUpdate" /t REG_DWORD /v AllowWindowsUpdate /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /t REG_DWORD /v BypassTPMCheck /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /t REG_DWORD /v BypassSecureBootCheck /d 1 /f
goto :EOF

:ENROLL
echo Applying changes......
echo Applied changes.
echo ------------------------------------------
echo   Enrolled to Windows %Channel% Channel.
echo ------------------------------------------
call :RESET_INSIDER_CONFIG 1>NUL 2>NUL
call :ADD_INSIDER_CONFIG 1>NUL 2>NUL
bcdedit /set {current} flightsigning yes >NUL 2>&1
echo Done.

echo.
IF %FlightSigningEnabled% NEQ 1 goto :ASK_FOR_REBOOT
pause
goto :EOF

:STOP_INSIDER
echo Applying changes....
echo Applied changes
echo -----------------------------------------------------------
echo   Insider builds are stopped from Windows Insider Channel
echo -----------------------------------------------------------
call :RESET_INSIDER_CONFIG 1>NUL 2>NUL
bcdedit /deletevalue {current} flightsigning >NUL 2>&1
echo Done.

echo.
IF %FlightSigningEnabled% NEQ 0 goto :ASK_FOR_REBOOT
pause
goto :EOF

:ASK_FOR_REBOOT
set "choice="
echo Reboot is required to finish applying changes.
echo PLEASE RESTART YOUR PC AFTER FINISHING ENROLLMENT OR AFTER FINISHING DISABLE GETTING BUILDS
set /p choice="Would you like to Restart your PC? (y/N) "
if /I "%choice%"=="y" shutdown -r -t 0
goto :EOF
