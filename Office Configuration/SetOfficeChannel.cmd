:: Filename: SetOfficeChannel.cmd
:: Author: Ian McKissick (ian@imckissick.com)
:: Description: 
::		Sets the update channel for Office 365 installs
::		This is only applicable to: Office 365 Business and Office 365 ProPlus
::		This will not work with home/consumer editions
::
::		Must be run as Admin

@echo off
title Set Office 365 Update Channel
mode con cols=80 lines=32
color 17
cls

:: Check to see if script is being run with Administrator privileges
:: Script will exit if not being run as Administrator
:checkForAdmin
	openfiles>nul 2>&1

	if %errorlevel% EQU 0 (
		goto :printMenu
	)

	echo.
	echo.   You are not running as Administrator.
	echo.
	echo.   Please run this from an Elevated Command Prompt
	echo.   Or Right-Click SetOfficeChannel.cmd and Select "Run as Administrator"
	echo.
	echo.   Press any key to exit...
	pause>nul
goto :eof

:: Displays menu of valid options for updating the Office 365 Update Channel
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

	goto :selectChannel
goto :eof

:: Gets user input to select the update channel
:: Valid options:
::		0 = Exit
:: 		1 = Semi-Annual Channel
:: 		2 = Semi-Annual Channel (Targeted)
:: 		3 = Monthly Channel
:: 		4 = Monthly Channel (Targeted)
:selectChannel
	set /p option=Select an option: 

	if %option% EQU 0 (
		goto :eof
	) else if %option% EQU 1 (
		set channel=Broad
		set channelname=Semi-Annual Channel
	) else if %option% EQU 2 (
		set channel=Targeted
		set channelname=Semi-Annual Channel ^(Targeted^)
	) else if %option% EQU 3 (
		set channel=Monthly
		set channelname=Monthly Channel
	) else if %option% EQU 4 (
		set channel=Insiders
		set channelname=Monthly Channel ^(Targeted^)
	) else (
		cls
		echo.
		echo.Invalid option.
		echo.
		echo.Press any key to continue . . .

		pause>nul

		goto :printMenu
	)

	goto :updateChannel
goto :eof

:: Update the Office 365 Update Channel to the channel select in :getInput
:: This will call OfficeC2RClient.exe
:updateChannel
	cls

	cd "C:\Program Files\Common Files\Microsoft Shared\ClickToRun"
	start /wait OfficeC2RClient.exe /changesetting channel=%channel%
	
	echo.
	echo.	The Office 365 Update Channel has been set to: %channelname%
	echo.
	
	start /wait OfficeC2RClient.exe /update user

	echo.	Attempting to install most recent %channelname% build now
	echo.
	echo.	If the installation fails, please reboot your computer and try again
	echo.
	echo.	If the installation still fails after that, the update channel may be
	echo.	explicity defined by your Office 365 Administrator
	echo.
	echo.	This script will now exit. Press any key to close the window...
	pause>nul
goto :eof