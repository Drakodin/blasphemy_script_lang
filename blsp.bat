@echo off
title blsp

if "%1" == "--version" goto :version
if "%1" == "--help" goto :help

if "%1" == "" (
    goto :help
)
:: Create an environment variable called "BLSP_MAIN" with the path to the blsp python file
:: Then this function can run
if defined BLSP_MAIN (
    goto :run
) else (
    echo BLSP_MAIN IS NOT DEFINED
    goto :end
)

:: Runs upon detection of BLSP Environment Variable
:run
echo Ready to process.
ping 127.0.0.1 -n 2 > nul
echo.
echo Initializing terminals interface...
ping 127.0.0.1 -n 2 > nul

set "p=%~dp1%~1"
set "d=^"%p%^""

set "blsp_path=^"%BLSP_MAIN%^""

goto :redirect

:: Routing for batch operations
:redirect
if "%2" == "testcompile" goto :compile
if "%2" == "export" goto :export

:: Script call to run JVM argument.
:compile
python %blsp_path% %d% testcompile
goto :result


:: Only exports .java file, does not check compilation.
:export
python %blsp_path% %d% export
goto :result

:result
echo.
echo Java file generated from %1
echo.
echo Task Executed.
goto :end



:version
echo Blasphemy Script 0.1.2.1
goto :end

:help
set "TAB=   "

echo List of possible arguments
echo %TAB% ["--version"]              : gets current version of Blasphemy Script
echo %TAB% ["--help"]                 : gets a list of possible commands
echo %TAB% ["<file.blsp> export"]     : transcribes input into a Java file
echo %TAB%                              containing a class of the same name
echo %TAB% ["<file.blsp> testcompile"]: exports transcribed Java file
echo %TAB%                              and compiles it using JAVA_HOME

goto :end

:end
title C:\Windows\System32\cmd.exe
exit /b 0