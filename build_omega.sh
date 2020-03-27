#!/bin/bash

echo
echo "Clean Build Directory"
echo 

rm -rf out
make clean && make mrproper

echo
echo "Create Working Directory"
echo

mkdir -p out

echo
echo "Set DEFCONFIG"
echo 
make O=out omega_defconfig

echo
echo "Build The Kernel"
echo 

export CROSS_COMPILE=aarch64-linux-gnu-
make O=out -j$(nproc --all)
