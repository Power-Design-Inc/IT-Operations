
if grep -Fq "DB" /etc/sysconfig/network
then
    TIER=DB
else
    TIER=APP
fi
echo $TIER
