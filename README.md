# *Omega Race* for the Commander X16
This is a (work in progress) port of the game *Omega Race* to the Commander X16. It is derived from the C64/Ultimax sources [here](https://github.com/mist64/cbmsrc/tree/master/OMEGA).

# How to build
**NOTE: You can't build *Omega Race* yet. The instructions below are only for future reference when the game has been fully ported and about to enter the final testing phase.**

Make sure you have at least one of the following:
 * A Windows machine with either Cygwin or MSYS2 installed
 * A Linux machine.
 * A Mac with [Homebrew](https://brew.sh) installed.

## Install dependencies
*Omega Race* depends on `ca65`.

### Windows
TODO: Add Windows build instructions

### Linux
Ubuntu, Debian, and their deriviatives:  
`sudo apt-get install build-essential cc65`

TODO: Add instructions for other distributions.

### Mac
Use Homebrew to install the `cc65` package.  
`brew install cc65`

## Begin the build
Type `make`. This will build *Omega Race* as a `omegax16.prg` file. Clean the build with `make clean`.

# Installation instructions
Copy the built `omegax16.prg` file to your X16's SD card and insert it to your X16. If you are using the X16 emulator, copy the file to where your X16 emulator files are stored.

Load the game with `/OMEGAX16.PRG`, and then type `RUN`.

# Licensing
The extensions to the base game, in order for it to run on the Commander X16, are published under the MIT License. The base game still uses a proprietary license. If any copyright holders are intrested in this port, please contact me at `www.fe32gr23@gmail.com`.
