rpi_scripts
===========

General Raspberry Pi scripts

1. GPshutdown.sh

Allows Raspberry Pi to be shutdown by grounding an input pin.

Add following line to   /etc/crontab

        @reboot      root        /directory..../GPshutdown.sh
