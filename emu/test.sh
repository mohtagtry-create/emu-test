adb shell getprop ro.product.cpu.abi
echo "===== launching app ====="
adb shell monkey -p com.anime.witcher 1
sleep 25
echo "===== logcat crash scan ====="
adb logcat -d | grep -iE "FATAL|AndroidRuntime|UnsatisfiedLink|dlopen|libAS7LAB|Process.*died|No package" | tail -70
echo "===== UI dump ====="
snap a
ui a