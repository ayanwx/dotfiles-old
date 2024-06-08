#!/bin/bash

rofi \
  -show menu \
  -modi "menu:rofi-power-menu --choices=shutdown/reboot/logout" \
  -theme-str "window {width: 24em;} listview {lines: 6;}"