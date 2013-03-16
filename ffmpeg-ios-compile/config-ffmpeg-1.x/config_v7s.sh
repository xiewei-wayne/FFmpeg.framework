#!/bin/bash
# this script won't work at the present.

echo This script is NOT working!!

exit;


#export DEVELOPER_ROOT_PATH=/Developer
#export CC=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/usr/bin/arm-apple-darwin10-gcc-4.2.1
#export SYS_ROOT=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.2.sdk

export DEVELOPER_ROOT_PATH=/Applications/Xcode.app/Contents/Developer
export CC=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/usr/bin/arm-apple-darwin10-llvm-gcc-4.2 
export LD=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/usr/bin/ld
export AR=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/usr/bin/ar
export SYS_ROOT=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.1.sdk

./configure --logfile=./logffmpeg.txt \
	--enable-cross-compile \
	--arch=armv \
	--target-os=darwin \
	--cpu=cortex-a8 \
	--cc=${CC} \
	--as="gas-preprocessor.pl ${CC}" \
	--prefix=./dist-armv7s/ \
	--disable-avdevice \
	--disable-devices \
	--disable-encoders \
	--disable-muxers \
        --disable-asm \
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
	--extra-cflags="-std=c99 -march=armv7s -mfpu=neon -mfloat-abi=softfp -isysroot ${SYS_ROOT}" \
	--extra-ldflags="-arch armv7s" \
	--sysroot="${SYS_ROOT}" \
	--disable-yasm \
        --ar=${AR}

#        --ld=${LD} \
#	--extra-ldflags="-arch armv7s -isysroot ${SYS_ROOT}" \
#	--disable-yasm \
#	--ld=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ld \
#	--ar=/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/ar \
#	--cpu=arm1176jzf-s \
#	--extra-cflags="-arch=armv7" \
#	--extra-ldflags="-arch=armv7" \
#

sed  -i '.ori' 's/CONFIGURATION.*$/CONFIGURATION \" \"/g' config.h

