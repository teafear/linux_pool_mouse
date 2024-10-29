#!/bin/bash

# Создаем конфигурацию для usbhid и устанавливаем частоту опроса
echo "options usbhid mousepoll=8" | sudo tee /etc/modprobe.d/usbhid.conf

# Перезагружаем модуль usbhid
sudo modprobe -r usbhid
sudo modprobe usbhid

