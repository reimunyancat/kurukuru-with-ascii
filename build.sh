#!/bin/bash

# Build script for Kuru Kuru ASCII Player
# Compilation with SFML3

echo "Kuru Kuru ASCII Player - Build Script"
echo "====================================="

echo "Compiling with g++ and SFML3..."

# Compile with SFML3
g++ -std=c++17 -O2 main.cpp -o main -lsfml-audio -lsfml-system

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo "Run './main' to start the kuru kuru player"
else
    echo "❌ Compilation failed!"
    echo "Please ensure SFML3 is properly installed"
    echo ""
    echo "Installation commands:"
    echo "  Arch Linux: sudo pacman -S sfml"
    echo "  Ubuntu: sudo apt install libsfml-dev"
    echo "  macOS: brew install sfml"
    echo "  Fedora: sudo dnf install SFML-devel"
    exit 1
fi
