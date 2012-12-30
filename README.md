FFmpeg.framework / libffmpeg
=========

iOS FFmpeg wrapper for ffmpeg v1.0


1) Dolby technologies needs license, DO NOT use dolby tech in your iOS app if you do not have a dolby license.

Remove the following tech from your ffmpeg v1.0 libs:
- Dolby Digital (AC3)
- Dolby Digital Plus (E-AC3)
- Dolby TrueHD (MLP)

2) You can compile your own ffmpeg lib, and replace the FFmpeg.framework from ffsdk.com
The FFmpeg.framework is just an wrapper of ffmpeg libs:
    libavcodec.a    
    libavformat.a   
    libavutil.a     
    libswresample.a 
    libswscale.a

3) How to compile ffmpeg libs for iOS?
Please refer to: https://github.com/xiewei-wayne/ffmpeg-ios-compile

4) How to compile FFmpeg.framework:
    Set FFmpeg, Simulator as active scheme.

    Debug: Command + B, or Xcode - Product -> Build For -> Testing
    Release: Xcode - Product -> Build For -> Profiling

Wayne
xiewei.max@gmail.com


