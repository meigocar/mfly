#!/bin/sh


cd v2ray/
echo "starting v2ray!"
nohup ./v2ray &
echo "started mfly"

cd ..
nohup ./ngrok http 8080 &

echo "started ngrok"
