#!/bin/bash

IP="192.168.1.80"
IP="192.168.23.5"

data1="lala=hurz&pattern=0,220,0,0;180,0,0,254;270,0,210,0&foo=bar"
data2="pattern=0,0,0,254;120,254,0,0;240,0,220,0"
data3="pattern=0,254,0,0;180,254,0,254"
data4="pattern=0,1,2,254;90,3,200,254;180,254,4,5;270,6,220,7"
data5="pattern=0,254,253,252"
data6="pattern=0,254,253,0"


dataset=($data1 $data2 $data3 $data4 $data5 $data6)
rand=$[$RANDOM % ${#dataset[@]}]
data="${dataset[$rand]}"


echo "[SENDING] ${data}"
curl --data "${data}" http://${IP}/?fnord=123

echo