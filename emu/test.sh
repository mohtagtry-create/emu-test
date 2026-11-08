adb shell getprop ro.product.cpu.abi
adb shell getprop ro.build.version.sdk
adb shell getprop ro.product.model
echo "===== installing ====="
adb install -r -t /data/local/tmp/emu_app.apk
echo "===== launching app ====="
adb shell monkey -p com.anime.witcher 1
sleep 25
echo "===== logcat crash scan ====="
adb logcat -d | grep -iE "FATAL|AndroidRuntime|UnsatisfiedLink|dlopen|libAS7LAB|Process.*died" | tail -60
echo "===== UI dump ====="
snap a
ui a