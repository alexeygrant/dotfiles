#!/bin/bash
##!/usr/bin/zsh
# baraction.sh for spectrwm status bar

## DISK
hdd() {
  hdd="$(df -h | awk 'NR==4{printf "%s/%s\n", $3, $2}')"
  echo -e "SSD:$hdd"
}

## RAM
mem() {
  mem=`free --human --si | awk '/Mem/ {printf "%dG/%dG\n", $3, $2 }'`
  echo -e "RAM:$mem"
}

## CPU
cpu() {
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "CPU:$cpu%"
}

## VOLUME
vol() {
    vol=`amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }' | sed 's/on://g'`
    echo -e "VOL:$vol"
}

SLEEP_SEC=3
#loops forever outputting a line every SLEEP_SEC secs

# It seems that we are limited to how many characters can be displayed via
# the baraction script output. And the the markup tags count in that limit.
# So I would love to add more functions to this script but it makes the 
# echo output too long to display correctly.
while :; do
    echo "+@fg=1; +@fn=0;$(cpu)+@fg=0;| +@fg=2;+@fn=0;$(mem)+@fg=0;| +@fg=3;+@fn=0;$(hdd)+@fg=0;| +@fg=4;+@fn=0;$(vol)+@fg=0;|"
	sleep $SLEEP_SEC
done
