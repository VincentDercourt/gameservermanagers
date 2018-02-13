#!/bin/bash

chown -R 1000:1000 /home/lgsm

if [ ! -d "/home/lgsm/lgsm/config-lgsm/"$serverName ]; then
  mkdir -p "/home/lgsm/lgsm/config-lgsm/"$serverName
fi

echo 'steamuser="'$steamuser'"' > /home/lgsm/lgsm/config-lgsm/$serverName/$serverName.cfg
echo 'steampass="'$steampass'"' >> /home/lgsm/lgsm/config-lgsm/$serverName/$serverName.cfg

chown -R 1000:1000 /home/lgsm

if [ ! -f "/home/lgsm/"$serverName ]; then
  /home/lgsm/linuxgsm.sh $serverName
fi

chown -R 1000:1000 /home/lgsm

if [ ! -d "serverfiles" ]; then
  yes Y | /home/lgsm/$serverName install
fi

chown -R 1000:1000 /home/lgsm

yes Y | ./$serverName update
yes Y | ./$serverName mods-update

yes Y | ./$serverName start

/bin/bash