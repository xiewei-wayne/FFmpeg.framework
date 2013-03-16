#!/bin/bash

#export DEVELOPER_ROOT_PATH=/Developer
#export CC=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/usr/bin/arm-apple-darwin10-gcc-4.2.1
#export SYS_ROOT=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk

export DEVELOPER_ROOT_PATH=/Applications/Xcode.app/Contents/Developer
export CC=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/usr/bin/arm-apple-darwin10-llvm-gcc-4.2
export SYS_ROOT=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.1.sdk

./configure --logfile=./logffmpeg.txt \
	--enable-cross-compile \
	--arch=arm \
	--target-os=darwin \
	--cpu=cortex-a8 \
	--cc=${CC} \
	--as="gas-preprocessor.pl ${CC}" \
	--prefix=./dist-armv7/ \
	--disable-avdevice \
	--disable-devices \
	--disable-encoders \
	--enable-encoder=png \
        --disable-decoder=ac3 --disable-decoder=eac3 --disable-decoder=mlp \
	--disable-muxers \
	--enable-swscale  \
  	--disable-postproc  \
	--disable-avfilter \
	--disable-bzlib   \
  	--disable-armv5te \
  	--disable-armv6  \
  	--disable-armv6t2 \
  	--disable-vfp  \
	--enable-network \
	--enable-pic \
	--enable-neon \
	--enable-gpl \
	--extra-cflags="-march=armv7-a -mfpu=neon -mfloat-abi=softfp -isysroot ${SYS_ROOT}" \
	--extra-ldflags="-isysroot ${SYS_ROOT}" \
	--disable-yasm \
        --disable-asm

#	--ld=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ld \
#	--ar=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ar \
#	--cpu=arm1176jzf-s \
#	--extra-cflags="-arch=armv7" \
#	--extra-ldflags="-arch=armv7" \
#

sed  -i '.ori' 's/CONFIGURATION.*$/CONFIGURATION \" \"/g' config.h

