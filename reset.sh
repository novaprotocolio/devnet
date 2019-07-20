#!/bin/bash

DATA_DIR=$PWD/$1
yes | ./bin/geth --datadir $DATA_DIR removedb