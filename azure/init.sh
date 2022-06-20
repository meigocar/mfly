#!/bin/sh
set -x

cd ~/
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
echo "install mfly done, begin download cloudflared"

cd ..

curl -L --output cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x start.sh
chmod +x cloudflared
echo "init done"

