@echo off

echo Kuru Kuru ASCII Player - Build Script
echo =====================================

echo Compiling with g++ and SFML3...

g++ -std=c++17 -O2 main.cpp -o main.exe -lsfml-audio -lsfml-system

if %errorlevel% equ 0 (
    echo Build successful!
) else (
    echo Compilation failed!
    exit /b 1
)

pause
