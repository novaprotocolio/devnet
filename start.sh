#!/bin/bash
DATA_DIR=$PWD/$1

if [ $1 == 'node1' ];then
    port=30311
    rpcport=8545
    wsport=8546
    account='0x31Ebd457b999Bf99759602f5Ece5AA5033CB56B3'
else
    port=30312
    rpcport=8547
    wsport=8548
    account='0xbd89f54c601cfee303ed61b9b5ae3be21cc09d66'
fi

NETWROK_ID=`jq .config.chainId $PWD/genesis.json`

cd ../cmd/nova

shift

# check jq program
if [ ! `command -v jq` ]; then
    echo "Installing jq ..."
    [ `uname -s | grep Darwin` ] && brew install jq || sudo apt-get install jq
fi

go run ./*.go --datadir $DATA_DIR --syncmode 'full' \
--port $port --rpc --rpcaddr '0.0.0.0' --rpcport $rpcport --wsport $wsport \
--rpcapi 'personal,db,eth,net,web3,txpool,miner,orderbook' --rpc --rpccorsdomain '*' \
--targetgaslimit 94000000 --bootnodes 'enode://6cf1b4f4391d387904c48fc18403b49d0df0588e0a20511f0ff830de30867f3e12daaf6138ccfc2583b4b76b7b5bc0b7493e1ae1cb5ae951cd1f6221b147ec50@127.0.0.1:30301' \
--networkid $NETWROK_ID --gasprice '1' --unlock $account \
--password $DATA_DIR/password.txt "$@"


