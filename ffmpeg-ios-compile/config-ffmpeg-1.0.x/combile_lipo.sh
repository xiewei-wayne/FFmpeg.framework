#!/bin/bash

set -e

ARCHS="armv6 armv7 i386"

for ARCH in $ARCHS
do
  if [ -d dist-$ARCH ]
  then
    MAIN_ARCH=$ARCH
  fi
done

if [ -z "$MAIN_ARCH" ]
then
  echo "Please compile an architecture"
  exit 1
fi


OUTPUT_DIR="dist-universal"
rm -rf $OUTPUT_DIR

mkdir -p $OUTPUT_DIR/lib $OUTPUT_DIR/include

for LIB in dist-$MAIN_ARCH/lib/*.a
do
  LIB=`basename $LIB`
  LIPO_CREATE=""
  for ARCH in $ARCHS
  do
    if [ -d dist-$ARCH ]
    then
      LIPO_CREATE="$LIPO_CREATE-arch $ARCH dist-$ARCH/lib/$LIB "
    fi
  done
  OUTPUT="$OUTPUT_DIR/lib/$LIB"
  echo "Creating: $OUTPUT"
  lipo -create $LIPO_CREATE -output $OUTPUT
  lipo -info $OUTPUT
done

echo "Copying headers from dist-$MAIN_ARCH..."
cp -R dist-$MAIN_ARCH/include/* $OUTPUT_DIR/include


#ref: http://stackoverflow.com/questions/6994151/problem-compiling-ffmpeg-for-iframeextractor