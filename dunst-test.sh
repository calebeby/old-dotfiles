#!/bin/bash
killall dunst
dunst -config ~/.config/dunst/dunstrc &

notify-send -u critical "some text" -i /usr/share/icons/Paper/48x48/categories/gnome-graphics.png
notify-send -u critical "Test message: critical test 1"
notify-send -u normal "Test message: normal test 2"
notify-send -u low "Test message: low test 3"
notify-send -u critical "Test message: critical test 4"
notify-send -u normal "Test message: normal test 5"
notify-send -u low "Test message: low test 6"
notify-send -u critical "Test message: critical test 7"
notify-send -u normal "Test message: normal test 8"
notify-send -u low "Test message: low test 9"
notify-send "foo" "bar"
notify-send --icon=gtk-info Test "This is a\ntest"

