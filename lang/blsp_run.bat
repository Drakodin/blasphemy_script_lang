@echo off &setlocal
echo BLSP Shell Compile Initiated
ping 127.0.0.1 -n 2 > nul

echo Task 1: Compile class from file provided.
:: Compile using version of Java installed on machine
:compile
javac %1
set "c=%~n1"

:: Run the compiled class
echo Task 2: Executing %c%.class
java %c%
ping 127.0.0.1 -n 2 > nul

:: Process completion.
echo Tasks completed. Check output for errors.
