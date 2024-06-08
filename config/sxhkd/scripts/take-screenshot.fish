set dir "$HOME/Pictures/Screenshots"
set filename (date +'%d%m%Y-%H%M%S')

maim -f png -su $dir/$filename.png

cat $dir/$filename.png \
    | xclip -selection clipboard -t image/png \
    && dunstify "$filename.png" --icon $dir/$filename.png
