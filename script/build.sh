#!/bin/bash

script_path=$(cd `dirname $0`; pwd)

pushd ${script_path}
python3 ad.py ../surge/ad.list
popd
