
@echo off

if [%1]==[] (
    echo Usage: build ^<llvm-path^>
    exit /b 1
)
if not [%2]==[] (
    echo Error: too many arguments, only expected 1
    exit /b 1
)
set LLVM_DIR=%1

call %~dp0vcvars.bat
echo LLVM_DIR is %LLVM_DIR%

@echo on
cmake .. -Thost=x64 -G "Visual Studio 16 2019" -A x64 ^
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=. -DCMAKE_PREFIX_PATH=%LLVM_DIR%
