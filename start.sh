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
    nohup v2ray/v2ray  > /dev/null &
else
    echo "v2ray is running!"
fi

cloudflared_id=$(ps -ef | grep cloudflared | grep -v grep | awk '{print $2}')
if [ "$cloudflared_id" = "" ]; then
    declare -i token
    read -p "请输入cloudflared token：" token
    nohup ./cloudflared --no-autoupdate tunnel run --token $token &
else
    echo "cloudflared is running!"
fi
