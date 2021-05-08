compile with:
arm-linux-gnueabihf-gcc -static -g -marm -mcpu=cortex-a7 keretProgram.c tokeletesSzam.S -o program

run with:
qemu-arm-static ./program
