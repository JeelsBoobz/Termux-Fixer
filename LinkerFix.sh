#!/bin/sh
apt install git make clang
git clone https://github.com/Harshiv-Patel/termux-elf-cleaner.git
cd termux-elf-cleaner
make
cp ./termux-elf-cleaner ../..
../../termux-elf-cleaner ./termux-elf-cleaner
cp ./termux-elf-cleaner $PREFIX/bin/
termux-elf-cleaner /data/data/com.termux/files/usr/lib/libcrypto.so
termux-elf-cleaner /data/data/com.termux/files/usr/lib/libssl.so
rm -Rf termux-elf-cleaner
