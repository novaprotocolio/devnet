## Start nodes

**Bootnode**
`yarn bootnode`

**Setup node**

```bash
yarn setup node1
yarn setup node2
```

**Run node**

```bash
yarn start node1 --mine
yarn start node2 --mine
```

**How to setup a genesis block with deployed contract**

```bash
# get block number then dump
./bin/geth dump `./bin/geth --exec "eth.blockNumber" attach http://localhost:8545` --datadir node2/

# remove a0 at first key
# after 94 is address value
```

**Problems**
_Returned error: replacement transaction underpriced_ => You have a pending transaction from your account in your Ethereum client
