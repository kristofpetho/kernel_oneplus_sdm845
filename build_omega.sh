#!/bin/bash

echo
echo "Clean Build Directory"
echo 

make clean && make mrproper
rm -rf out

echo
echo "Create Working Directory"
echo

mkdir -p out

echo
echo "Set DEFCONFIG"
echo 
make O=out omega_defconfig
export PATH="/home/kristof/android/clang/bin:/home/kristof/android/binutils/bin:${PATH}"
export LD_LIBRARY_PATH="/home/kristof/android/clang/lib:/home/kristof/android/clang/lib64:$LD_LIBRARY_PATH"

echo
echo "Build The Kernel"
echo 

make -j$(nproc --all) O=out \
                      CC=clang \
                      CLANG_TRIPLE=aarch64-linux-gnu- \
                      CROSS_COMPILE=aarch64-linux-gnu-
