#!/bin/sh
apt install git make clang
cd $HOME
git clone https://github.com/Harshiv-Patel/termux-elf-cleaner.git
cd termux-elf-cleaner
make
cp ./termux-elf-cleaner ../..
../../termux-elf-cleaner ./termux-elf-cleaner
cp ./termux-elf-cleaner $PREFIX/bin/
for i in $PREFIX/lib/*.so* do [ -z "$(readelf -d "$i" |grep NODELETE)" ] || termux-elf-cleaner "$i"; done 
cd $HOME
rm -Rf $HOME/termux-elf-cleaner
