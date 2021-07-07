 song="$(\
    dbus-send --print-reply --dest=org.mpris.MediaPlayer2."spotify" /org/mpris/MediaPlayer2 \
    org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' \
    string:'Metadata' |\
    awk -F '"' 'BEGIN {RS=" entry"}; /"xesam:artist"/ {a = $4} /"xesam:album"/ {b = $4}
                /"xesam:title"/ {t = $4} END {print a " \n" b " \n" t}'
)"
echo $song
