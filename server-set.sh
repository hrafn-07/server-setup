#! /bin/bash

timedatectl set-ntp true
timedatectl set-timezone Europe/Istanbul

echo "Enter hostname :"
read hostname
echo "Hostname = " $hostname
hostnamectl set-hostname testbartexs.barterss.com
ip = $(hostname -I)
echo $ip " " $hostname >> /etc/hosts
apt update
apt upgrade
