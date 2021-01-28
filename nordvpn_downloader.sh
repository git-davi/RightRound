#!/bin/bash

mkdir -p vpn_config/conn
cd vpn_config/conn
URLS=$(curl -s https://nordvpn.com/ovpn/ | grep -Po '(?<=<a href=").*?(?=" class="Button Button--primary Button--small">Download UDP</a>)')
for url in ${URLS[@]}
do 
    wget $url
done