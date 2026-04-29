#!/bin/sh


exec op-reth node \
  --chain="${RETH_CHAIN}" \
  --datadir="${RETH_DATADIR:-/data}" \
  --authrpc.jwtsecret="${RETH_AUTHRPC_JWTSECRET:-/shared/jwt.hex}" \
  --authrpc.addr="${RETH_AUTHRPC_ADDR:-0.0.0.0}" \
  --authrpc.port="${RETH_AUTHRPC_PORT:-8551}" \
  --http \
  --http.addr="${RETH_HTTP_ADDR:-0.0.0.0}" \
  --http.port="${RETH_HTTP_PORT:-8545}" \
  --http.api="${RETH_HTTP_API:-eth,net,web3,debug,txpool,admin,rpc}" \
  --http.corsdomain="${RETH_HTTP_CORSDOMAIN:-*}" \
  --ws \
  --ws.addr="${RETH_WS_ADDR:-0.0.0.0}" \
  --ws.port="${RETH_WS_PORT:-8546}" \
  --ws.api="${RETH_WS_API:-eth,net,web3,debug,txpool,admin,rpc}" \
  --metrics="${RETH_METRICS_ADDR:-0.0.0.0}:${RETH_METRICS_PORT:-9001}" \
  --addr="${RETH_ADDR:-0.0.0.0}" \
  --port="${RETH_PORT:-30303}" \
  --discovery.v5.port="${RETH_DISCOVERY_PORT:-30303}" \
  --bootnodes=${RETH_BOOTNODES} \
  --rollup.sequencer-http="${RETH_ROLLUP_SEQUENCERHTTP}" \
  --rollup.disable-tx-pool-gossip \
  $@
