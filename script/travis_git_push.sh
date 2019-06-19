#!/bin/bash

script_path=$(cd `dirname $0`; pwd)

pushd ${script_path}
cd ..
git add surge/ad.list
git diff --cached --exit-code >/dev/null
if [ $? -ne 0 ]; then
    echo "change detected"
    remote_address=`git remote get-url --push origin | sed 's/^https:\/\//https:\/\/xyzrlee:${GITHUB_TOKEN}@/'`
    git remote set-url origin ${remote_address}
    git config user.email "cnrickylee@gmail.com"
    git config user.name "xyzrlee"
    git commit -m "travis commit"
    git push
else
    echo "no change detected"
fi
popd
