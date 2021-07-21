var=$(colorpicker --short --one-shot | awk -F 'd' '{ print tolower($1)}');
echo "$var";
echo "$var" |tr -d '\n' | xclip -selection clipboard; notify-send  " " "<span color='$var' font='26px'><b>$var</b></span><span font='20'> Copied to clipboard </span>";
