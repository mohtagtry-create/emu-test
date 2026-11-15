set -e
printf '\n--- installed package ---\n'
adb shell pm path $PKG
printf '\n--- native library selection ---\n'
adb shell dumpsys package $PKG | grep -E 'primaryCpuAbi|secondaryCpuAbi|codePath' | head -5 || true
printf '\n--- clean launch logs ---\n'
adb logcat -c
adb shell am force-stop $PKG
adb shell monkey -p $PKG 1
sleep 15
snap slim_repaired_launch
ui slim_repaired_launch
printf '\n--- process status ---\n'
adb shell pidof $PKG || true
printf '\n--- fatal/coroutine/mpv logs ---\n'
adb logcat -d -v threadtime | grep -Ei 'AndroidRuntime|FATAL EXCEPTION|MainDispatcherLoader|MissingResourceException|ServiceConfigurationError|dlopen|libmpv|nativeloader' | tail -100 || true
printf '\n--- Flutter activity ---\n'
adb shell dumpsys activity activities | grep -E 'ResumedActivity|mResumedActivity|topResumedActivity' | head -10 || true
