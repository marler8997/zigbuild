@echo off

if [%VisualStudioVersion%]==[16.0] (
     echo Already in a "Visual Studio 16 2019" command prompt
     exit /b 0
)

if not [%VisualStudioVersion%]==[] (
    echo Error: wrong VisualStudioVersion "%VisualStudioVersion%", start a new command prompt
    exit /b 1
)

echo Not inside a Visual Studio Command Prompt, attempting to make it one...
set "vcvars=C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvarsall.bat"
if exist "%vcvars%" (
    call "%vcvars%" x64
    exit /b 0
)

echo Error: could not find a Visual Studio command prompt vcvarsall script
exit /b 1
