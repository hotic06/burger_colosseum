#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

pushd ${SCRIPT_DIR}/../auto_start

sed -e s/hotic06/$1/ 01.sh > tmp
mv tmp 01.sh

sed -e s/hotic06/$1/ 02.sh > tmp
mv tmp 02.sh

sed -e s/hotic06/$1/ 03.sh > tmp
mv tmp 03.sh

popd
