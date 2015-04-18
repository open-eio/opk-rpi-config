sudo -s
# download new rpi image
wget http://downloads.raspberrypi.org/raspbian/images/raspbian-2015-02-17/2015-02-16-raspbian-wheezy.zip
# insert new SDcard in my case /dev/sdb1 gets mounted ... umount
umount /dev/sdb1
zcat 2015-02-16-raspbian-wheezy.zip > /dev/sdb
# insert SDcard into rpi2 with serial cable attached to the laptop
#https://learn.adafruit.com/adafruits-raspberry-pi-lesson-5-using-a-console-cable/test-and-configure
screen /dev/ttyUSB0 115200
# login using username pi password raspberry
sudo -s
raspi-config
# advanced options
## enable ssh server
## enable i2c
## set memory split to 16
# and reboot and login again
sudo -s
# set up the wifi -- need wifi dongle plugged into USB
ifdown wlan0  
iwconfig wlan0 mode Managed essid <open network> key off
dhclient -v wlan0
aptitude update # will take a few seconds, will look unresponsive for a moment
aptitude upgrade # will take several minutes 
reboot
# login again
sudo -s
ifdown wlan0
iwconfig wlan0 mode Managed essid <open network> key off
dhclient -v wlan0
aptitude install vim
# install node http://nodered.org/docs/hardware/raspberrypi.html
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y build-essential python-dev python-rpi.gpio nodejs
# install pirateship
#cd /root
#git clone https://github.com/pirate-sh/ip.git
#cd ip
#npm install
#npm link
npm install pirate-sh
