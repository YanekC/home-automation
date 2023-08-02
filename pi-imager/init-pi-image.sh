#!/bin/bash

#Vars
IMAGE_NAME=raspios_lite_arm64-2023-05-03/2023-05-03-raspios-bullseye-arm64-lite.img.xz


#Install imager on workstation
wget --output-document /tmp/latest-pi-imager.deb https://downloads.raspberrypi.org/imager/imager_latest_amd64.deb
apt install -y /tmp/latest-pi-imager.deb
apt autoremove -y

wget --no-clobber --output-document /tmp/latest-arm64-pi-image https://downloads.raspberrypi.org/raspios_lite_arm64/images/"$IMAGE_NAME"
wget --output-document /tmp/latest-arm64-pi-image.sha256 https://downloads.raspberrypi.org/raspios_lite_arm64/images/"$IMAGE_NAME".sha256

echo "$(cat /tmp/latest-arm64-pi-image.sha256) /tmp/latest-arm64-pi-image" | sha256sum --check
if ! echo "$(cat /tmp/latest-arm64-pi-image.sha256) /tmp/latest-arm64-pi-image" | sha256sum --check;
then
  exit $?
fi