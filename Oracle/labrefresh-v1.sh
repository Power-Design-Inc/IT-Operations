#!/bin/bash

### variables
LOG=log_file
PASSWORD="welcome123"
APPIP=""
DBIP=""
DNS1=""
DNS2=""
GW=""
CURRENTAPP=""
CURRENTDB=""
PDIDNS1="172.27.1.150"
PDIDNS2="172.27.1.151"
DCDNS1="10.34.240.150"
DCDNS2="10.34.240.151"
PDIGW="172.27.1.1"
DCGW="10.34.240.1"
LABN=""

### create log file or overrite if already present
printf "Log File - " > $LOG

### append date to log file
date >> $LOG

clear

### Ask user for 2 digits for a lab refresh
read -n 2 -p  "Enter the 2 digit lab you wish to refresh: " LABN
echo "$?"
#echo $LABN
CURRENTAPP="LABORAAPP$LABN"
CURRENTDB="LABORADB$LABN"
printf "You have chosen to refresh $CURRENTDB"
sleep 2s
echo "$?"

### Uncomment for Testing input
#printf $CURRENTAPP
#echo "$?"
#printf $CURRENTDB
#echo "$?"

### Display the contents of the hosts file
#sed -n 3,4p /etc/hosts

#BOTH DB & APPS STUFFS

### modify the hosts file by deleting lines 3 and 4
sed -i '3,4d' /etc/hosts
printf "You have deleted lines 3 & 4 from the hosts file"
sleep 2s
echo "$?"

### remove the udev network config rules
rm -f /etc/udev/rules/70-*
printf "You have removed the network udev rules"
sleep 2s
echo "$?"

### set password to something that is easily guessed
passwd root --stdin <<< "$PASSWORD"
printf "You have changed the root password"
sleep 2s
echo "$?"


# DB ON STUFFS

#APP ONLY STUFFS
if [$LABN=01]
  then
    cp /etc/clonedir/dbeth01 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=02]
  then
    cp /etc/clonedir/dbeth02 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=03]
  then
    cp /etc/clonedir/dbeth03 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=04]
  then
    cp /etc/clonedir/dbeth04 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=11]
  then
    cp /etc/clonedir/dbeth11 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=12]
  then
    cp /etc/clonedir/dbeth12 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=13]
  then
    cp /etc/clonedir/dbeth13 /etc/sysconfig/network-scripts/ifcfg-eth0
  fi

printf "You have set the LAB network parameters to $DBIP"
sleep 2s
echo "$?"

### modify the sysconfig network file to match the host
sed -i s/PDIVLORCLAPP/$CURRENTDB/ /etc/sysconfig/network
printf "You have set the network file to match the lab instance"
sleep 2s
echo "$?"

### remove the udev network config rules
rm -f /etc/sysconfig/network-scripts/ifcfg-eth1
printf "You have removed the udev network config rules"
sleep 2s
echo "$?"

### hugepages variable only set on DB
cp /etc/clonedir/sysctl.conf /etc/sysctl.conf
printf "You have set the hugepages attribute on $CURRENTDB"
sleep 2s
echo "$?"

### APP ONLY STUFFS
### copies over the correct pre staged eth config for the network adapter
if [$LABN=01]
  then
    cp /etc/clonedir/appeth01 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=02]
  then
    cp /etc/clonedir/appeth02 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=03]
  then
    cp /etc/clonedir/appeth03 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=04]
  then
    cp /etc/clonedir/appeth04 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=11]
  then
    cp /etc/clonedir/appeth11 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=12]
  then
    cp /etc/clonedir/appeth12 /etc/sysconfig/network-scripts/ifcfg-eth0
  elif [$LABN=13]
  then
    cp /etc/clonedir/appeth13 /etc/sysconfig/network-scripts/ifcfg-eth0
  fi

# Echo the changes for verification
printf "You have set the LAB network parameters to $APPIP"
sleep 2s
echo "$?"


### modify the network config files
#if [$LABN=01]
#  then
    cp /etc/clonedir/eth01 /etc/sysconfig/network-scripts/ifcfg-eth0
    #APPIP="172.27.1.221"
    #DBIP="172.27.1.222"
    #DNS1="172.27.1.150"
    #DNS2="172.27.1.151"
    #GW="172.27.1.150"
#  elif [$LABN=02]
#  then
#    cp /etc/clonedir/eth02 /etc/sysconfig/network-scripts/ifcfg-eth0
    #APPIP="172.27.1.223"
    #DBIP="172.27.1.224"
    #DNS1="172.27.1.150"
    #DNS2="172.27.1.151"
    #GW="172.27.1.150"
#  elif [$LABN=03]
#  then
#    cp /etc/clonedir/eth03 /etc/sysconfig/network-scripts/ifcfg-eth0
    #APPIP="172.27.1.225"
    #DBIP="172.27.1.226"
    #DNS1="172.27.1.150"
    #DNS2="172.27.1.151"
    #GW="172.27.1.150"
#  elif [$LABN=04]
#  then
#    cp /etc/clonedir/eth04 /etc/sysconfig/network-scripts/ifcfg-eth0
    #APPIP="172.27.1.227"
    #DBIP="172.27.1.228"
    #DNS1="172.27.1.150"
    #DNS2="172.27.1.151"
    #GW="172.27.1.150"
#  elif [$LABN=11]
#  then
#    cp /etc/clonedir/eth11 /etc/sysconfig/network-scripts/ifcfg-eth0
    #APPIP="10.34.240.50"
    #DBIP="10.34.240.51"
    #DNS1="10.34.240.150"
    #DNS2="10.34.240.151"
    #GW="10.34.240.1"
#  elif [$LABN=12]
#  then
#    cp /etc/clonedir/eth12 /etc/sysconfig/network-scripts/ifcfg-eth0
    #APPIP="10.34.240.52"
    #DBIP="10.34.240.53"
    #DNS1="10.34.240.150"
    #DNS2="10.34.240.151"
    #GW="10.34.240.1"
#  elif [$LABN=13]
#  then
#    cp /etc/clonedir/eth13 /etc/sysconfig/network-scripts/ifcfg-eth0
    #APPIP="10.34.240.56"
    #DBIP="10.34.240.54"
    #DNS1="10.34.240.150"
    #DNS2="10.34.240.151"
    #GW="10.34.240.1"
#  fi

# old - sed -i s/IPADDR=172.27.1.211/IPADDR=$DBIP/ -e s/DNS1=172.27.1.11/DNS1=$DNS1/ -e s/DNS2=172.27.1.12/DNS1=$DNS2/ -e s/GATEWAY=172.27.1.1/GATEWAY=$GW/ /etc/sysconfig/network-scripts/ifcfg-eth0
#printf "You have set the LAB network parameters to $DBIP"
#sleep 2s
#echo "$?"

### remove the udev network config rules
# rm -f /etc/udev/rules/70-*
# rm -f /etc/sysconfig/network-scripts/ifcfg-eth1
#printf "You have removed the udev network config rules"
#sleep 2s
#echo "$?"

### hugepages variable only set on DB
# old - sed -i s/^vm.nr_hugepages/vm.nr_hugepages = 0/ /etc/sysctl.conf
#cp /etc/clonedir/sysctl.conf /etc/sysctl.conf
#printf "You have set the hugepages attribute on $CURRENTDB"
#sleep 2s
#echo "$?"

### set password to something that is easily guessed
#passwd root --stdin <<< "$PASSWORD"
#printf "You have changed the root password"
#sleep 2s
#echo "$?"
