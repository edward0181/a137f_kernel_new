#!/bin/bash
mkdir out
export ARCH=arm64
#export LLVM=1
export CLANG_PREBUILT_BIN=$(pwd)/toolchain/clang-proton/bin
export PATH=$PATH:$CLANG_PREBUILT_BIN
BUILD_CROSS_COMPILE=$(pwd)/toolchain/clang-proton/bin/aarch64-linux-gnu-
KERNEL_LLVM_BIN=$(pwd)/toolchain/clang-proton/bin/clang
CLANG_TRIPLE=aarch64-linux-gnu-

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -j7 -C $(pwd) O=$(pwd)/out ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE CONFIG_SECTION_MISMATCH_WARN_ONLY=y a13ve_defconfig
make -j7 -C $(pwd) O=$(pwd)/out ARCH=arm64 CROSS_COMPILE=$BUILD_CROSS_COMPILE CC=$KERNEL_LLVM_BIN CLANG_TRIPLE=$CLANG_TRIPLE CONFIG_SECTION_MISMATCH_WARN_ONLY=y

cp out/arch/arm64/boot/Image.gz $(pwd)/arch/arm64/boot/Image.gz
