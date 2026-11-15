adb logcat -c
adb shell am start -W -n com.my_anime.app/anime.rifts.MainActivity
sleep 20
adb logcat -d -v brief ActivityTaskManager AndroidRuntime MediaKit Coroutine Flutter '*:F' | tail -n 250
snap repaired-launch
ui repaired-ui
