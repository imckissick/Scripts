@echo off
title Clear Print Spooler
mode con cols=80 lines=32
color 17
cls

:: Check to see if script is being run with Administrator privileges
:: Script will exit if not being run as Administrator
:checkForAdmin
	openfiles>nul 2>&1

	if %errorlevel% EQU 0 (
		goto :ClearPrintSpooler
	)

	echo.
	echo.   You are not running as Administrator.
	echo.
	echo.   Please run this from an Elevated Command Prompt
	echo.   Or Right-Click ClearPrintSpooler.cmd and Select "Run as Administrator"
	echo.
	echo.   Press any key to exit...
	pause>nul
goto :eof

:ClearPrintSpooler
    echo.   Stopping the Print Spooler service
    echo.
    
    net stop spooler
    
    echo.   Clearing the Printer Spooler...
    echo.

    del /f /Q C:\Windows\System32\spool\PRINTERS\*
    
    echo.   Print Spooler has been cleared
    echo.
    echo.   Starting the Print Spooler service
    echo. 
    net start spooler

	echo.	"Press any key to exit..."
	pause>nul
goto :eof