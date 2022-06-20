#!/bin/sh
v2ray=~/v2ray
if [ ! -d $v2ray ];then
    echo 需要重新初始化环境，进行中...
    curl -L --output init.sh https://raw.githubusercontent.com/meigocar/mfly/main/azure/init.sh
    chmod +x init.sh && ./init.sh
else
    echo 环境存在。
fi

v2ray_id=$(ps -ef | grep v2ray | grep -v grep | awk '{print $2}')
if [ "$v2ray_id" = "" ]; then
    nohup v2ray/v2ray &
else
    echo "v2ray is running!"
fi

cloudflared_id=$(ps -ef | grep cloudflared | grep -v grep | awk '{print $2}')
if [ "$cloudflared_id" = "" ]; then
    nohup ./cloudflared --no-autoupdate tunnel run --token eyJhIjoiNmQxZjBjZDJiODhhMzQzOWYyOGY3ODI1OGYxNzg5NjAiLCJ0IjoiYjZlNmE2NjItOWYyMS00MGQwLWJiZWEtZDMzNDViYzE3MmY5IiwicyI6IjlKOS9FK250OGxKQ05HU0ZGRWFXMTk5bjFxdVRXMmlOc0JkR3NLQ1hUbGM9In0= &
else
    echo "cloudflared is running!"
fi



