#!/bin/bash

BASE_DIR=$PWD
DATA_DIR=$PWD/$1

if [ ! -f $BASE_DIR/bin/geth ];then
    cd ../novalex/cmd/geth
    go build -o $BASE_DIR/bin/geth
    cd $BASE_DIR
fi

./reset.sh $1

./bin/geth --datadir $DATA_DIR init genesis.json
