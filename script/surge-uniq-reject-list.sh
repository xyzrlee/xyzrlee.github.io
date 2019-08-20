#!/bin/bash

script_path=$(cd `dirname $0`; pwd)

export LC_ALL=C

pushd ${script_path}/..

tmp_dir="$(mktemp -d)"
cp surge/reject-other.list ${tmp_dir}/reject-other.list.ori
cp surge/ad.list ${tmp_dir}/ad.list.ori

pushd ${tmp_dir}
sort -u ad.list.ori >ad.list
grep -v -f ad.list reject-other.list.ori | sort -u >reject-other.list
popd

cp ${tmp_dir}/*.list surge/
rm -rf ${tmp_dir}

popd
