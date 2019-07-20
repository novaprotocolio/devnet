BASE_DIR=$PWD

if [ ! -f $BASE_DIR/bin/bootnode ];then
    cd ../go-ethereum/cmd/bootnode
    go build -o $BASE_DIR/bin/bootnode
    cd $BASE_DIR
fi

./bin/bootnode -nodekey boot.key -addr :30301 "$@"
