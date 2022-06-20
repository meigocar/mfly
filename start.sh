#!/bin/sh

cd v2ray/
echo "starting v2ray!"
nohup ./v2ray &
echo "started mfly"
cd ..

declare -i c
echo 1. 启动cloudflared
echo 2. 启动ngrok
read -p "请选择：" c
if [ $c -eq 1 ]
  echo TODO
then
  nohup ./ngrok http 8088 &  
  echo "started ngrok"
fi

