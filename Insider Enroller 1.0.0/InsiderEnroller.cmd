@setlocal DisableDelayedExpansion
@echo off
set "scriptver=1.0.0"

set "_cmdf=%~f0"
if exist "%SystemRoot%\Sysnative\cmd.exe" (
setlocal EnableDelayedExpansion
start %SystemRoot%\Sysnative\cmd.exe /c ""!_cmdf!" "
exit /b
)
if exist "%SystemRoot%\SysArm32\cmd.exe" if /i %PROCESSOR_ARCHITECTURE%==AMD64 (
setlocal EnableDelayedExpansion
start %SystemRoot%\SysArm32\cmd.exe /c ""!_cmdf!" "
exit /b
)
set "SysPath=%SystemRoot%\System32"
if exist "%SystemRoot%\Sysnative\reg.exe" (set "SysPath=%SystemRoot%\Sysnative")
set "Path=%SysPath%;%SystemRoot%;%SysPath%\Wbem;%SysPath%\WindowsPowerShell\v1.0\"

for /f "tokens=6 delims=[]. " %%i in ('ver') do set build=%%i

if %build% LSS 18362 (
    echo =-------------------------------------------------------------=
    echo  The script is compatible only with Windows 10 v1903 and later
    echo =-------------------------------------------------------------=
    echo.
    echo          ==========
    echo Download Windows 11 at https://bit.ly/Win11ISODown
    echo          ==========
    echo. Note : Some PCs are not compatible with Windows 11
    echo.
    echo         =================
    echo Download Windows 10 21H2 at https://bit.ly/Win1020H2ISO
    echo         =================
    echo go to select edition and select Windows 10 Insider Preview
    echo.
    echo         ===========
    echo Download Windows 10 Latest Version at https://bit.ly/Win1021H1
    echo         ===========
    echo This Link will straightly start Downloading the ISO file.
    echo.
    pause
    goto :EOF
)

reg query HKU\S-1-5-19 1>nul 2>nul
if %ERRORLEVEL% equ 0 goto :START_SCRIPT

echo =--------------------------=--------------------------=
echo     This script needs Administrator rights to run
echo =--------------------------=--------------------------=
echo.
echo To run it as Administrator right click and select Run As Administrator
echo.
pause
goto :EOF

:START_SCRIPT
set "FlightSigningEnabled=0"
bcdedit /enum {current} | findstr /I /R /C:"^flightsigning *Yes$" >nul 2>&1
if %ERRORLEVEL% equ 0 set "FlightSigningEnabled=1"

:CHOICE_MENU
cls
set "choice="
echo                                  ============================
echo                                    Insider-Enroller v%scriptver%
echo                                  ============================
echo.
echo ===============================================================================
echo 1 :- Enroll to Dev Channel (Recommended for Developers and Professional Users)  [Requires Reboot if you are not Windows Insider]
echo ===============================================================================
echo (New Features will be release first to this channel and this channel have more bugs and errors)
echo.
echo =============================================================
echo 2 :- Enroll to Beta Channel (Recommended for Personal users)  [Requires Reboot if you are not Windows Insider]
echo =============================================================
echo (New features are release to this channel monthly from dev channel this channel have less bugs and errors compared to Dev channel)
echo.
echo =======================================================================
echo 3 :- Enroll to Release Preview Channel(Recommended for business users)  [Requires Reboot if you are not Windows Insider]
echo =======================================================================
echo (New Features will be released to this channel slightly before public release this channel may have some bugs [No possiblity of bugs and errors])
echo.
echo ====================================================
echo 4 :- Leave Windows Insider Program(Requires Reboot)
echo ====================================================
echo ================================================
echo 5 :- Quit the script without making any changes
echo ================================================
echo.
set /p choice="Enter Number of your Choice: "
echo.
echo Your choice is "%choice%"
echo.
if /I "%choice%"=="1" goto :ENROLL_DEV
if /I "%choice%"=="2" goto :ENROLL_BETA
if /I "%choice%"=="3" goto :ENROLL_REPRE
if /I "%choice%"=="4" goto :STOP_INSIDER
if /I "%choice%"=="5" goto :EOF
goto :CHOICE_MENU

:ENROLL_REPRE
set "Channel=ReleasePreview"
set "Fancy=Release Preview Channel"
set "BRL=8"
set "Content=Mainline"
set "Ring=External"
set "RID=11"
goto :ENROLL

:ENROLL_BETA
set "Channel=Beta"
set "Fancy=Beta Channel"
set "BRL=4"
set "Content=Mainline"
set "Ring=External"
set "RID=11"
goto :ENROLL

:ENROLL_DEV
set "Channel=Dev"
set "Fancy=Dev Channel"
set "BRL=2"
set "Content=Mainline"
set "Ring=External"
set "RID=11"
goto :ENROLL

:RESET_INSIDER_CONFIG
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Account" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Cache" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Restricted" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ToastNotification" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\WUMUDCat" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\Ring%Ring%" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\RingExternal" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\RingPreview" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\RingInsiderSlow" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\RingInsiderFast" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /f /v AllowTelemetry
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /f /v AllowTelemetry
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f /v BranchReadinessLevel
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup" /t REG_DWORD /v AllowUpgradesWithUnsupportedTPMOrCPU /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\WindowsUpdate" /t REG_DWORD /v AllowWindowsUpdate /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /t REG_DWORD /v BypassTPMCheck /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /t REG_DWORD /v BypassSecureBootCheck /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI" /f /t REG_DWORD /v UIControllableState /d 0

goto :EOF

:ADD_INSIDER_CONFIG
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Orchestrator" /f /t REG_DWORD /v EnableUUPScan /d 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\Ring%Ring%" /f /t REG_DWORD /v Enabled /d 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\SLS\Programs\WUMUDCat" /f /t REG_DWORD /v WUMUDCATEnabled /d 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_DWORD /v EnablePreviewBuilds /d 2
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_DWORD /v IsBuildFlightingEnabled /d 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_DWORD /v IsConfigSettingsFlightingEnabled /d 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_DWORD /v IsConfigExpFlightingEnabled /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_DWORD /v TestFlags /d 32
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_DWORD /v RingId /d %RID%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_SZ /v Ring /d "%Ring%"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_SZ /v ContentType /d "%Content%"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_SZ /v BranchName /d "%Channel%"
if %build% LSS 22000 reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings" /f /t REG_SZ /v StickyXaml /d "<StackPanel xmlns="^""http://schemas.microsoft.com/winfx/2006/xaml/presentation"^""><TextBlock Style="^""{StaticResource BodyTextBlockStyle }"^"">This device has been enrolled to the Windows Insider program using Insider-Enroller v%scriptver%. If you want to change settings of the enrollment or stop receiving Insider Preview builds, please use the script. <Hyperlink NavigateUri="^""https://github.com/Jathurshan-2019/offlineinsiderenroll/blob/master/readme.md"^"" TextDecorations="^""None"^"">Learn more about Script at GitHub</Hyperlink></TextBlock><TextBlock Text="^""Applied configuration"^"" Margin="^""0,20,0,10"^"" Style="^""{StaticResource SubtitleTextBlockStyle}"^"" /><TextBlock Style="^""{StaticResource BodyTextBlockStyle }"^"" Margin="^""0,0,0,5"^""><Run FontFamily="^""Segoe MDL2 Assets"^"">&#xECA7;</Run> <Span FontWeight="^""SemiBold"^"">%Fancy%</Span></TextBlock><TextBlock Text="^""Channel: %Channel% Channel"^"" Style="^""{StaticResource BodyTextBlockStyle }"^"" /><TextBlock Text="^""Content: %Content%"^"" Style="^""{StaticResource BodyTextBlockStyle }"^"" /><TextBlock Text="^""Telemetry settings notice"^"" Margin="^""0,20,0,10"^"" Style="^""{StaticResource SubtitleTextBlockStyle}"^"" /><TextBlock Style="^""{StaticResource BodyTextBlockStyle }"^"">Windows Insider Program requires ^<Span FontWeight="^""SemiBold"^"">Optional diagnostic data</Span>. You can verify or modify your current settings in <Span FontWeight="^""SemiBold"^"">Diagnostics &amp; feedback</Span>.</TextBlock><Button Command="^""{StaticResource ActivateUriCommand}"^"" CommandParameter="^""ms-settings:privacy-feedback"^"" Margin="^""0,10,0,0"^""><TextBlock Margin="^""5,0,5,0"^"">Open Diagnostics &amp; feedback</TextBlock></Button></StackPanel>"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /f /t REG_DWORD /v UIHiddenElements /d 65535
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /f /t REG_DWORD /v UIDisabledElements /d 65535
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /f /t REG_DWORD /v UIServiceDrivenElementVisibility /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /f /t REG_DWORD /v UIErrorMessageVisibility /d 192
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /f /t REG_DWORD /v AllowTelemetry /d 3
if defined BRL reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f /t REG_DWORD /v BranchReadinessLevel /d %BRL%
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /f /t REG_DWORD /v UIHiddenElements_Rejuv /d 65534
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility" /f /t REG_DWORD /v UIDisabledElements_Rejuv /d 65535
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /f /t REG_SZ /v UIRing /d "%Ring%"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /f /t REG_SZ /v UIContentType /d "%Content%"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /f /t REG_SZ /v UIBranch /d "%Channel%"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /f /t REG_DWORD /v UIOptin /d 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_SZ /v RingBackup /d "%Ring%"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_SZ /v RingBackupV2 /d "%Ring%"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_SZ /v BranchBackup /d "%Channel%"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Cache" /f /t REG_SZ /v PropertyIgnoreList /d "AccountsBlob;;CTACBlob;FlightIDBlob;ServiceDrivenActionResults"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Cache" /f /t REG_SZ /v RequestedCTACAppIds /d "WU;FSS"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Account" /f /t REG_DWORD /v SupportedTypes /d 3
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Account" /f /t REG_DWORD /v Status /d 8
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\Applicability" /f /t REG_DWORD /v UseSettingsExperience /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v AllowFSSCommunications /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v UICapabilities /d 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v IgnoreConsolidation /d 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v MsaUserTicketHr /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v MsaDeviceTicketHr /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v ValidateOnlineHr /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v LastHR /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v ErrorState /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v PilotInfoRing /d 3
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v RegistryAllowlistVersion /d 4
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\ClientState" /f /t REG_DWORD /v FileAllowlistVersion /d 1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI" /f /t REG_DWORD /v UIControllableState /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /f /t REG_DWORD /v UIDialogConsent /d 0
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /f /t REG_DWORD /v UIUsage /d 26
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /f /t REG_DWORD /v OptOutState /d 25
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Selection" /f /t REG_DWORD /v AdvancedToggleState /d 24
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup" /t REG_DWORD /v AllowUpgradesWithUnsupportedTPMOrCPU /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\WindowsUpdate" /t REG_DWORD /v AllowWindowsUpdate /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /t REG_DWORD /v BypassTPMCheck /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig" /t REG_DWORD /v BypassSecureBootCheck /d 1 /f
if %build% LSS 21990 goto :EOF
(
echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsSelfHost\UI\Strings]
echo "StickyMessage"="{\"Message\":\"Device Enrolled Using Insider-Enroller v%scriptver%\",\"LinkTitle\":\"\",\"LinkUrl\":\"\",\"DynamicXaml\":\"^<StackPanel xmlns=\\\"http://schemas.microsoft.com/winfx/2006/xaml/presentation\\\"^>^<TextBlock Style=\\\"{StaticResource BodyTextBlockStyle }\\\"^>This device has been enrolled to the Windows Insider program using Insider-Enroller v%scriptver%. If you want to change settings of the enrollment or stop receiving Insider Preview builds, please use the script. ^<Hyperlink NavigateUri=\\\"https://github.com/Jathurshan-2019/offlineinsiderenroll/blob/master/readme.md\\\" TextDecorations=\\\"None\\\"^>Learn more about Script^</Hyperlink^>^</TextBlock^>^<TextBlock Text=\\\"Applied configuration\\\" Margin=\\\"0,20,0,10\\\" Style=\\\"{StaticResource SubtitleTextBlockStyle}\\\" /^>^<TextBlock Style=\\\"{StaticResource BodyTextBlockStyle }\\\" Margin=\\\"0,0,0,5\\\"^>^<Run FontFamily=\\\"Segoe MDL2 Assets\\\"^>^&#xECA7;^</Run^> ^<Span FontWeight=\\\"SemiBold\\\"^>%Fancy%^</Span^>^</TextBlock^>^<TextBlock Text=\\\"Channel: %Channel% Channel\\\" Style=\\\"{StaticResource BodyTextBlockStyle }\\\" /^>^<TextBlock Text=\\\"Content: %Content%\\\" Style=\\\"{StaticResource BodyTextBlockStyle }\\\" /^>^<TextBlock Text=\\\"Telemetry settings notice\\\" Margin=\\\"0,20,0,10\\\" Style=\\\"{StaticResource SubtitleTextBlockStyle}\\\" /^>^<TextBlock Style=\\\"{StaticResource BodyTextBlockStyle }\\\"^>Windows Insider Program requires ^<Span FontWeight=\\\"SemiBold\\\"^>optional diagnostic data^</Span^>. You can verify or modify your current settings in ^<Span FontWeight=\\\"SemiBold\\\"^>Diagnostics ^&amp; feedback^</Span^>.^</TextBlock^>^<Button Command=\\\"{StaticResource ActivateUriCommand}\\\" CommandParameter=\\\"ms-settings:privacy-feedback\\\" Margin=\\\"0,10,0,0\\\"^>^<TextBlock Margin=\\\"5,0,5,0\\\"^>Open Diagnostics ^&amp; feedback^</TextBlock^>^</Button^>^</StackPanel^>\",\"Severity\":0}"
echo.
)>"%SystemRoot%\oie.reg"
regedit /s "%SystemRoot%\oie.reg"
del /f /q "%SystemRoot%\oie.reg"
goto :EOF

:ENROLL
echo Applying changes.
echo.
call :RESET_INSIDER_CONFIG 1>NUL 2>NUL
echo resetting some values
echo.
call :ADD_INSIDER_CONFIG 1>NUL 2>NUL
echo adding some values
echo.
bcdedit /set {current} flightsigning yes >nul 2>&1
echo :):):):):):):):):):):):):):):):):):)
echo         Applied Successfully
echo :):):):):):):):):):):):):):):):):):)
echo. 
echo You are Enrolled to %Channel% Channel
echo.
echo ===================
echo     :) Done. :)
echo ===================
echo.


echo.
if %FlightSigningEnabled% neq 1 goto :ASK_FOR_REBOOT
echo =========================
echo   Press any key to exit
echo =========================
pause >nul
goto :EOF

:STOP_INSIDER
echo Applying changes...
echo.
call :RESET_INSIDER_CONFIG 1>nul 2>nul
bcdedit /deletevalue {current} flightsigning >nul 2>&1
echo :(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(
echo    Leaved Insider Program Successfully.
echo :(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(:(
echo.
echo ============
echo     Done
echo ============

echo.
if %FlightSigningEnabled% neq 0 goto :ASK_FOR_REBOOT
echo Press any key to exit.
pause >nul
goto :EOF

:ASK_FOR_REBOOT
set "enter your choice="
echo ===============================================
echo |Reboot is required to finish applying changes|
echo ===============================================
echo.
set /p choice="Would you like to reboot your PC? (y/N) "
if /I "%choice%"=="y" shutdown -r -t 0
goto :EOF
