@echo off

rem Build script for Kuru Kuru ASCII Player
rem Compilation for SDL3 and SDL3_mixer on Windows

echo Kuru Kuru ASCII Player - Build Script
echo =====================================

echo Compiling with g++ and SDL3...

rem Compile with SDL3 and SDL3_mixer
g++ -std=c++17 -O2 main.cpp -o main.exe -lSDL3 -lSDL3_mixer

if %errorlevel% equ 0 (
    echo ✅ Build successful!
    echo Run 'main.exe' to start the kuru kuru player
) else (
    echo ❌ Compilation failed!
    echo Please ensure SDL3 and SDL3_mixer are properly installed
    echo.
    echo Installation on Windows:
    echo   1. Download SDL3 development libraries from https://github.com/libsdl-org/SDL
    echo   2. Download SDL3_mixer from https://github.com/libsdl-org/SDL_mixer
    echo   3. Extract to a folder and add to your compiler's include/lib paths
    echo   4. Or use vcpkg: vcpkg install sdl3 sdl3-mixer
    pause
    exit /b 1
)

pause
