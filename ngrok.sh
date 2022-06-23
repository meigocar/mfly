#!/bin/sh
rm -rf v2ray
rm -rf v2ray-linux-64.zip*
mkdir v2ray
cd v2ray
wget https://github.com/v2fly/v2ray-core/releases/download/v4.45.0/v2ray-linux-64.zip
echo "Downloaded binary v2ray-linux-64.zip"
unzip v2ray-linux-64.zip
# Set config file
cat <<EOF >./config.json
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [
        {
            "listen": "0.0.0.0",
            "port": 8088,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "74592d79-c1c0-434a-ac08-b7a3143e7739",
                        "alterId": 0
                    }
                ],
                "disableInsecureEncryption": true
            },
            "streamSettings": {
                "network": "ws"
            }
        }
    ],
    "outbounds": [
        {
            "protocol": "freedom"
        }
    ]
}
EOF
echo "install mfly done, begin download ngrok"

nohup ./v2ray &
echo "start v2ray"

cd ..
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xzvf ngrok-v3-stable-linux-amd64.tgz
echo "Install done"
./ngrok config add-authtoken 28yujkS0AbUtkyQwg2CX8fUCq6N_5A8Eeonau3GaR3Vv3KXCq

nohup ./ngrok http 8088 &

echo "start ngrok"

