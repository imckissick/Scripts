:mode
	echo off
	title Set Office 365 Update Channel
	mode con cols=80 lines=32
	color 17
	cls

	goto checkForElevation
goto :eof

:checkForElevation
	openfiles>nul 2>&1

	if %errorlevel% EQU 0 goto PrintMenu

    echo.   Checking for Administrator elevation.
    echo.   You are not running as Administrator.
    echo.
    echo.   Please run this from an Elevated Command Prompt
    echo.   Or Right-Click SetOfficeChannel.cmd and Select Run as Administrator
    echo.
	echo.   Press any key to continue...
	pause>nul
goto :eof

:printMenu
	cls
	echo.
	echo.Select new Office 365 Update Channel
    echo.
	echo.   1. Semi-Annual Channel
	echo.   2. Semi-Annual Channel (Targeted)
	echo.   3. Monthy Channel
	echo.   4. Monthy Channel (Targeted)
	echo.
	echo.                                            0. Close.
	echo.

	goto getInput
goto :eof

:getInput
	set /p option=Select an option: 

	if %option% EQU 0 (
		goto :eof
	) else if %option% EQU 1 (
		set channel=Broad
		set channelname="Semi-Annual Channel"
	) else if %option% EQU 2 (
		set channel=Targeted
		set channelname="Semi-Annual Channel (Targeted)"
	) else if %option% EQU 3 (
		set channel=Monthly
		set channelname="Monthly Channel"
	) else if %option% EQU 4 (
		set channel=Insiders
		set channelname="Monthly Channel (Targeted)"
	) else (
		cls
		echo.
		echo.Invalid option.
		echo.
		echo.Press any key to continue . . .
		
        pause>nul
        goto printMenu
	)

	goto updateChannel
goto :eof

:UpdateChannel
	cls
	echo.
	echo.Setting Office 365 Update Channel to %channelname%
    echo.

	cd "C:\Program Files\Common Files\Microsoft Shared\ClickToRun"
    echo start /wait OfficeC2RClient.exe /changesetting channel=%channel%
	echo.

	echo.Installing most recent %channelname% build now
	echo.Please wait...
    echo.
	
	echo start /wait OfficeC2RClient.exe /update user

	echo.Installation complete. Press any key to exit...
	pause>nul
goto :eof
