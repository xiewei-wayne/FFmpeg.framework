#!/bin/bash

export DEVELOPER_ROOT_PATH=/Developer

export DEV_ROOT=${DEVELOPER_ROOT_PATH}/Platforms/iPhoneSimulator.platform/Developer

export SYS_ROOT=${DEV_ROOT}/SDKs/iPhoneSimulator4.2.sdk

export host=i686-apple-darwin9

export LANG=en_US.US-ASCII
export PATH="${DEV_ROOT}/usr/bin:/Developer/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export CC=$DEV_ROOT/usr/bin/gcc
export LD=$DEV_ROOT/usr/bin/ld
export CPP=$DEV_ROOT/usr/bin/cpp
export CXX=$DEV_ROOT/usr/bin/g++
export NM=$DEV_ROOT/usr/bin/nm
export CXXCPP=$DEV_ROOT/usr/bin/cpp
export RANLIB=$DEV_ROOT/usr/bin/ranlib
export AS="gas-preprocessor.pl $CC"

unset AR
unset AS

export CFLAGS="-arch i386 -fmessage-length=0 -pipe -Wno-trigraphs -fpascal-strings -O0 -fasm-blocks -Wreturn-type -Wunused-variable -D__IPHONE_OS_VERSION_MIN_REQUIRED=40000 -isysroot $SYS_ROOT -fvisibility=hidden -mmacosx-version-min=10.6 -gdwarf-2"

export CXXFLAGS=$CFLAGS
export LDFLAGS="$CFLAGS -L$SYS_ROOT/usr/lib"


./configure --logfile=./logffmpeg.txt \
	--disable-doc \
    --enable-cross-compile --disable-armv5te --enable-decoder=h264 --enable-pic \
	--target-os=darwin --arch=i386 --cpu=i386 \
	--prefix=./dist-i386/ \
    --enable-debug=2 \
	--disable-avdevice \
	--disable-devices \
	--disable-encoders \
	--enable-encoder=png \
    --disable-decoder=ac3 --disable-decoder=eac3 --disable-decoder=mlp \
	--disable-muxers \
	--enable-swscale  \
  	--disable-postproc  \
	--disable-avfilter \
	--disable-yasm \
	--disable-mmx \
	--disable-bzlib   \
	--enable-network \
	--enable-gpl \
	--target-os=darwin 

sed  -i '.ori' 's/CONFIGURATION.*$/CONFIGURATION \" \"/g' config.h
