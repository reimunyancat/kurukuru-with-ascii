# Kururin ASCII Art Player

## Overview
This project converts a video into colored ASCII art frames and plays them in the terminal synchronized with music.

- Use Python (`frame.py`) to convert an mp4 video into colored ASCII art text frames (`frames/`)
- Use C++ (`main.cpp`) to play the generated frames in the terminal while synchronizing with an mp3 audio file (`kuru_kuru.mp3`)

## Folder & File Structure
- `frame.py`: Script to convert a video into colored ASCII art frame `.txt` files
- `main.cpp`: Program to play ASCII frames and mp3 music in the terminal
- `frames/`: Folder containing the generated ASCII art frame `.txt` files
- `kuru_kuru.mp4`: Source video file to convert
- `kuru_kuru.mp3`: Audio file to play
- `requirements.txt`: Python dependency list (`opencv-python`)

## Usage
### 1. Convert Frames (Python)
```bash
pip install -r requirements.txt
python3 frame.py
```
- The `frames/` folder will be filled with files like `frame_0000.txt`, `frame_0001.txt`, ...

### 2. Play (C++)
#### Install SDL2 and SDL2_mixer (example for Arch Linux and Ubuntu)
- Arch Linux:
  ```bash
  sudo pacman -S sdl2 sdl2_mixer
  ```
- Ubuntu:
  ```bash
  sudo apt install libsdl2-dev libsdl2-mixer-dev
  ```
#### Build and Run
```bash
g++ -std=c++17 -o main main.cpp -lSDL2 -lSDL2_mixer -pthread
./main
```
