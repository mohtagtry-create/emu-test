
adb shell monkey -p $PKG 1 >/dev/null 2>&1
sleep 12
snap home; ui home
# open first card (hero area) then check page renders
adb shell input tap 1080 1200
sleep 5
snap detail; ui detail
