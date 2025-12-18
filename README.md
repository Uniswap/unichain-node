# Unichain Node

![image](logo.png)

This repository contains the relevant configuration to run your own node on the Unichain network.

### Troubleshooting

If you encounter problems with your node, please open a [GitHub issue](https://github.com/Uniswap/unichain-node/issues)

### Supported Networks

| Network      | Status |
|-------------------| ------ |
| Mainnet | ✅     |
| Testnet (Sepolia) | ✅     |


### Usage

1. Ensure you have an Ethereum L1 full node RPC available, and set `OP_NODE_L1_ETH_RPC` & `OP_NODE_L1_BEACON` (in the `.env.mainnet` file).

   If running your own L1 node:
   
   - It needs to be synced before Unichain will be able to fully sync.

   - Use Docker host gateway IP as containers cannot access host services via `localhost` or `127.0.0.1`.
     ```
     OP_NODE_L1_ETH_RPC=http://172.17.0.1:8545
     OP_NODE_L1_BEACON=http://172.17.0.1:3500
     ```
   
   - Your L1 node needs to allow connections from Docker containers.

2. Select your network in the docker compose file by uncommenting .env.sepolia or .env.mainnet in both op-node and the execution client.
3. Run:

```
docker compose up -d
```

4. You should now be able to `curl` your Unichain node:

```
curl -d '{"id":1,"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest",false]}' \
  -H "Content-Type: application/json" http://localhost:8545
```

5. To stop your node, run:
```
docker compose down
```

#### Persisting Data

By default, the data directory is stored in `${PROJECT_ROOT}/geth-data`. You can override this by modifying the value of
`HOST_DATA_DIR` variable in the [`.env`](./.env) file.
