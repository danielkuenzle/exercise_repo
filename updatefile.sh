# !/usr/bin/env bash
# File: updatefile.sh
# Author: Daniel Kuenzle

fn=$(basename $1)
tn=./temp/$fn
mkdir temp
cd temp
curl -O $1
cd ..
if [[ $(cat $fn | shasum) != $(cat $tn | shasum) ]]
then
	mv $tn $fn
fi
rm -r temp
