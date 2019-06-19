#!/bin/bash

script_path=$(cd `dirname $0`; pwd)

pushd ${script_path}
cd ..
git add surge/ad.list
git diff --cached --exit-code >/dev/null
if [ $? -ne 0 ]; then
    echo "change detected"
    remote_address=`git remote get-url --push origin | sed 's/^https:\/\//https:\/\/xyzrlee:test/'`
    echo ${remote_address}
fi
popd
