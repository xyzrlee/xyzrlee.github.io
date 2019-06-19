#!/bin/bash

script_path=$(cd `dirname $0`; pwd)

pushd ${script_path}
python3 ad.py ../ad.list
popd
