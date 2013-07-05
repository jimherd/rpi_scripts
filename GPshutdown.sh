#!/bin/bash

#
# GPshutdown.sh : shutdown shell script
#
# Checks a digital input pin and initiates shutdown if value is
# a zero.  Uses WiringPi package.
#
# -Raspberry Pi Rev2. GPIO layout:
#
# GPIO pins
#
#   P1-01: 3.3v       P1-10: GPIO15     P1-20: GND
#   P1-02: 5.0v       P1-11: GPIO17     P1-21: GPIO9
#   P1-03: GPIO2      P1-12: GPIO18     P1-22: GPIO25
#   P1-04: 5.0v       P1-13: GPIO27     P1-23: GPIO11
#   P1-05: GPIO3      P1-14: GND        P1-24: GPIO8
#   P1-06: GND        P1-15: GPIO22     P1-25: GND
#   P1-07: GPIO4      P1-16: GPIO23     P1-26: GPIO7   
#   P1-08: GPIO14     P1-17: 3.3v    
#   P1-09: GND        P1-18: GPIO24
#                     P1-19: GPIO10
#
# Jim Herd : modified to use GPIO25
#

#if [[ $EUID -ne 0 ]]; then
#  echo "Error: This script must be run as root" >&2
# exit 1
# fi

SHUTDOWN_PIN=25

gpio -g mode "$SHUTDOWN_PIN" up
gpio -g mode "$SHUTDOWN_PIN" in

while ( true )
do
    value=$(gpio -g read $SHUTDOWN_PIN)
    if [ $value -eq 0 ]
        then
            echo "Shutdown"
            sudo shutdown -h now
            exit 0
        else
            # echo "sleep..."
            sleep 10
    fi
done
