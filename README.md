# Unichain Node

![image](logo.png)

This repository contains the relevant configuration to run your own node on the Unichain network.

### Troubleshooting

If you encounter problems with your node, please open a [GitHub issue](https://github.com/Uniswap/unichain-node/issues)

### Supported Networks

| Network      | Status |
|-------------------| ------ |
| Testnet (Sepolia) | ✅     |


### Usage

1. Clone unichain-node repository
```
git clone https://github.com/Uniswap/unichain-node
```
3. Naviguate to unichain-node directory
```
cd unichain-node
```
4. Ensure you have an Ethereum L1 full node RPC available, and set `OP_NODE_L1_ETH_RPC` & `OP_NODE_L1_BEACON` (in the `.env.sepolia` file). If running your own L1 node, it needs to be synced before Unichain will be able to fully sync.
```
nano .env.sepolia
```
Use CTRL+X to save your modifications
5. Run:

```
docker compose up -d
```

6. You should now be able to `curl` your Unichain node:

```
curl -d '{"id":1,"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest",false]}' \
  -H "Content-Type: application/json" http://localhost:8545
```

7. To stop your node, run:
```
docker compose down
```
8. Check unichain-node-op-node-1 logs
```
docker logs unichain-node-op-node-1
```
9. Check logs of unichain-node-execution-client-1
```
docker logs unichain-node-execution-client-1
```
#### Persisting Data

By default, the data directory is stored in `${PROJECT_ROOT}/geth-data`. You can override this by modifying the value of
`HOST_DATA_DIR` variable in the [`.env`](./.env) file.
