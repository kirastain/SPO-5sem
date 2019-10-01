#!/bin/bash
git clone https://github.com/andrejv/maxima
cd Maxima
sudo apt-get install g++-mingw-w64-i686 cmake nsis wine automake texinfo rsync p7zip-full tcl-dev tk-dev texlive g++ libgl1-mesa-dev gettext
cd crosscompile-windows/build # change to the build directory
cmake ..
make
make package
cd ..
cd ..
cd ..
mv ./Maxima /tmp
