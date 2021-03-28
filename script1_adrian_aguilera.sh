#!/bin/bash

wget http://www.collados.org/asix2/m06/uf2/pr2/usuaris.ods
libreoffice --convert-to csv usuaris.ods usuaris.csv --headless
clear

usuaris="usuaris.csv"
IFS=","
while read user name
do
useradd -m $name -g users -s /bin/bash
# force user to change his/her password after login
passwd -e $user
done < $usuaris
echo "1"
