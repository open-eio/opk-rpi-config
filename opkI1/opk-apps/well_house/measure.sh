#!/bin/bash

cd /home/pi/opk-apps/well_house/

# pull value from the USB sensor, generate a json packet with id 'temp', and push it to phant using the keys in the local directory

/home/pi/opk-drivers/opk-temper1-cli/pull --json temp | /home/pi/opk-drivers/opk-phant-json/push -v
