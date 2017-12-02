# SFML Starter Project

This project is an empty project completely setup to build an C++ SFML application.
It uses the project configuration of Visual Studio Code.
It is possible to build on Windows and Linux in two default target (Debug and Release) and it is possible to debug using breakpoints.


## Project setup

* Install the C/C++ Visual Studio Code extension.

### Linux

* Install g++-4.9:
```bash
sudo apt install g++-4.9
```

* Add SMFL librairies to `LD_LIBRARY_PATH` environement variable:
```bash
sudo ldconfig <repository-folder>/Development/Librairies/Linux/SFML/lib
```

### Windows

* Install GCC 6.1.0 MinGW (SEH) - 64-bit [Download](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/6.1.0/threads-posix/seh/x86_64-6.1.0-release-posix-seh-rt_v5-rev0.7z/download)

* Add the path where mingw32-make.exe and gdb.exe are located in your PATH.

## Change the application name

* Change the `APPNAME` variable in the makefile file.
    APPNAME=Game 

* Change the application name accordingly in `.vscode/launch.json` file.

* Configure your include paths in `c_cpp_properties.json`.

## Improvements to work on

* Compile SFML with g++ 6 on Linux
    For now the project is setup for the C++11 standard since the linux SFML library has been compiled with g++ 4 (https://gcc.gnu.org/projects/cxx-status.html). 
