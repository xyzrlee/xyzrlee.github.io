#!/bin/bash

script_path=$(cd `dirname $0`; pwd)
pushd ${script_path}/..

DIR="$(mktemp -d)"
wget https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt -O ${DIR}/gfwlist.txt
gfwlist2privoxy -i ${DIR}/gfwlist.txt -f ${DIR}/gfwlist.action -p 127.0.0.1:1080 -t socks5

mkdir -p privoxy
cp -v ${DIR}/gfwlist.action privoxy/

popd