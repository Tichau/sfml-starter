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

** TO DO **

## Change the application name

* Change the `APPNAME` variable in the makefile file.
    APPNAME=Game 

* Change the application name accordingly in `.vscode/launch.json` file.
