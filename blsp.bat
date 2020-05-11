@echo off
title blsp

if "%1" == "--version" goto :version
if "%1" == "--v" goto :version
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
if "%2" == "debug" goto :compile
if "%2" == "export" goto :export
if "%2" == "run" goto :compile

:: Script call to run JVM argument.
:compile
python %blsp_path% %d%
goto :jvm-setup

:: Sets up file path for jvm operation
:jvm-setup
set "JAVA_EXT=.java"
set "fn=%~n1"

set "c1=%fn:~0,1%"
for %%s in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do call set "c1=%%c1:%%s=%%s%%"
set "fn=%c1%%fn:~1%"

set "jp=%fn%%JAVA_EXT%"

goto :jvm-call

:: Calls the jvm attached to Path, whatever one comes first.
:jvm-call
javac %jp%
echo.
rem Something about this line without quotes causes a "Bad Magic Number" error
rem Therefore, quotes were added to avoid it. Reason: "CAFEBABE" missing.
echo File compiled: "%fn%.java -> %fn%.class"
echo.
ping 127.0.0.1 -n 2 > nul

::Routing to essentially remove .java file after compilation.
if "%2" == "run" goto :run

echo Executing...

java %fn%
goto :result

:run
del /f %fn%.java
echo Executing...
java %fn%
goto :result

:: Only exports .java file, does not check compilation.
:export
python %blsp_path% %d%
echo File generated: %1 -> %fn%.java
goto :result

:result
echo.
echo Task Executed.
goto :end



:version
echo Blasphemy Script Interpreter v0.1.4
echo Blasphemy Script Language v0.1.4
goto :end

:help
set "TAB=   "

echo List of possible arguments
echo %TAB% ["--version", "-v"]              : Gets current version of Blasphemy Script
echo %TAB% ["--help"]                       : Gets a list of possible commands
echo %TAB% ["<file.blsp> export"]           : Transcribes input into a Java file
echo %TAB%                                    containing a class of the same name
echo %TAB% ["<file.blsp> debug"]            : Exports transcribed Java file
echo %TAB%                                    and compiles it with JVM on Path
echo %TAB% ["<file.blsp> run"]              : Exports Java file to be compiled and run. 
echo %TAB%                                    Removes transcribed file after compilation.

goto :end

:end
title C:\Windows\System32\cmd.exe
exit /b 0