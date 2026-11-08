#!/bin/bash
mkdir -p out
AAPT=$(ls -d "${ANDROID_HOME:-/usr/local/lib/android/sdk}"/build-tools/*/aapt 2>/dev/null | tail -1)
PKG=$($AAPT dump badging emu/app.apk 2>/dev/null | grep -m1 "^package:" | cut -d"'" -f2)
export PKG
echo "PKG=$PKG" > out/info.txt
adb logcat -c
adb logcat -v time > out/logcat.txt &
LP=$!
snap(){ adb exec-out screencap -p > "out/$1.png"; }
ui(){ adb shell uiautomator dump /sdcard/u.xml >/dev/null 2>&1; adb exec-out cat /sdcard/u.xml > "out/$1.xml"; }
adb install -r emu/app.apk > out/install.txt 2>&1
source emu/test.sh > out/test_out.txt 2>&1
snap final; ui final
kill $LP
