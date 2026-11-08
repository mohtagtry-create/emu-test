CO="com.anime.witcher.tags_search.TagSearchActivity"
# launch genre page: أكشن
adb shell am start -n "$CO" --es tag_name "أكشن" --es tag_type "Genre"
sleep 30
# capture UI structure -> shows element texts in order
adb shell uiautomator dump /sdcard/ui.xml >/dev/null 2>&1
adb shell cat /sdcard/ui.xml > /tmp/genre_ui.xml
echo "=== UI dump (texts in vertical order) ==="
grep -oE 'text="[^"]*"' /tmp/genre_ui.xml | sed 's/text=//' | head -60
echo "=== logcat errors ==="
adb logcat -d | grep -iE 'FATAL|AndroidRuntime|Exception' | tail -20