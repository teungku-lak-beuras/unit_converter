@echo off

@rem Bat-chan version 1.2.

cls
color 0a
echo Bat-chan: Task begin.

:begin_parse
if "%~1" == "" (
    echo Bat-chan: No known argument given, assuming running in debug mode in 2 seconds...
    timeout /t 2
    flutter run --debug --verbose
)

if "%~1" == "release" (
    echo Bat-chan: Got it, running in release mode in 2 seconds...
    timeout /t 2
    flutter run --release --verbose
)

if "%~1" == "clean" (
    echo Bat-chan: Got it, entering maid mode and cleaning in 2 seconds...
    timeout /t 2
    flutter clean
)
