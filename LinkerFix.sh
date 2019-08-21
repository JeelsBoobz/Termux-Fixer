#!/bin/sh
cd $HOME
if [ -z $PREFIX/bin/termux-elf-cleaner ]
then
	apt install git make clang
	git clone https://github.com/Harshiv-Patel/termux-elf-cleaner.git
	cd termux-elf-cleaner
	make
	cp ./termux-elf-cleaner ../..
	../../termux-elf-cleaner ./termux-elf-cleaner
	cp ./termux-elf-cleaner $PREFIX/bin/
	rm -Rf $HOME/termux-elf-cleaner
	cd $HOME
fi
for i in $PREFIX/lib/*.so* do [ -z "$(readelf -d "$i" |grep NODELETE)" ] || termux-elf-cleaner "$i"; done 
