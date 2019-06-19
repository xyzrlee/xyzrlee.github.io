#!/bin/bash

script_path=$(cd `dirname $0`; pwd)

pushd ${script_path}
cd ..
git add surge/ad.list
git diff --cached --exit-code >/dev/null
if [ $? -ne 0 ]; then
    echo "change detected"
    git remote get-url --push origin
fi
popd
