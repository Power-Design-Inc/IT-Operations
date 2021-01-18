#!/bin/bash

### Setup the variables
LOG=log_file
PASSWORD="welcome123"
TIER=""
CURRENTAPP=""
CURRENTDB=""
LABN=""

### create log file or overrite if already present
printf "Log File - " > $LOG
date >> $LOG
clear

### Search the network host file to see what tier you are working with
if grep -Fq "ORCLDB" /etc/sysconfig/network
then
    TIER=DB
else
    TIER=APP
fi
echo $TIER

### Ask user for 2 digits for a lab refresh
read -n 2 -p  "Enter the 2 digit lab you wish to refresh: " LABN
echo "You have chosen to refresh LAB $LABN"
sleep 2s

### BOTH DB & APPS STUFFS

### modify the hosts file by deleting lines 3 and 4
sed -i.bak '3,4 d' /etc/hosts
printf "You have deleted lines 3 & 4 from the hosts file"
sleep 2s
echo ""

### remove the udev network config rules
rm -f /etc/udev/rules/70-*
printf "You have removed the network udev rules"
sleep 2s
echo ""

### set password to something that is easily guessed
passwd root --stdin <<< "$PASSWORD"
printf "You have changed the root password"
sleep 2s
echo ""

### DB ONLY STUFFS
#start the if/elif on APP & DB Tier
if [ $TIER=="DB" ];  then
  CURRENTDB="LABORADB$LABN"
  if [ $LABN == "01" ]; then
        yes | cp /etc/clonedir/dbeth01 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "02" ]; then
        yes | cp /etc/clonedir/dbeth02 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "03" ]; then
        yes | cp /etc/clonedir/dbeth03 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "04" ]; then
        yes | cp /etc/clonedir/dbeth04 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "11" ]; then
        yes | cp /etc/clonedir/dbeth11 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "12" ]; then
        yes | cp /etc/clonedir/dbeth12 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "13" ]; then
        yes | cp /etc/clonedir/dbeth13 /etc/sysconfig/network-scripts/ifcfg-eth0
    else echo "You did not properly select a lab refresh number"
  fi

  printf "You have set the network parameters for $CURRENTDB"
  sleep 2s
  echo ""

  ### modify the sysconfig network file to match the host
  sed -i.bak s/PDIVLORCLDB/$CURRENTDB/ /etc/sysconfig/network
  printf "You have set the network file to match the lab instance"
  sleep 2s
  echo ""

  ### remove the udev network config rules
  rm -f /etc/sysconfig/network-scripts/ifcfg-eth1
  printf "You have removed uneccessary network adapters"
  sleep 2s
  echo ""

  ### hugepages variable only set on DB
  yes | cp /etc/clonedir/sysctl.conf /etc/sysctl.conf
  printf "You have set the hugepages attribute on $CURRENTDB"
  sleep 2s
  echo ""


  ### APP ONLY STUFFS
elif [ $TIER=="APP" ];
  then $CURRENTAPP="LABORAAPP$LABN"

  ### copies over the correct pre staged eth config for the network adapter
  if [ $LABN == "01" ]; then
          yes | cp /etc/clonedir/appeth01 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "02" ]; then
          yes | cp /etc/clonedir/appeth02 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "03" ]; then
          yes | cp /etc/clonedir/appeth03 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "04" ]; then
          yes | cp /etc/clonedir/appeth04 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "11" ]; then
          yes | cp /etc/clonedir/appeth11 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "12" ]; then
          yes | cp /etc/clonedir/appeth12 /etc/sysconfig/network-scripts/ifcfg-eth0
      elif [ $LABN == "13" ]; then
          yes | cp /etc/clonedir/appeth13 /etc/sysconfig/network-scripts/ifcfg-eth0
    else
        echo "You did not properly select a lab refresh number"
  fi

  ### Echo the changes for verification
  printf "You have set the network parameters for $CURRENTAPP"
  sleep 2s
  echo ""
fi

### Echo the changes for verification
printf "You have completed the Oracle clone process"
sleep 2s
exit
