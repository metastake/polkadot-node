#!/bin/bash

set -e

# Runtime Flags
flags=( 
	'VALIDATOR_ENABLED,--validator'
	'VALIDATOR_DISCOVER_LOCAL,--discover-local'
	'VALIDATOR_UNSAFE_RPC_EXTERNAL,--unsafe-rpc-external'
	'VALIDATOR_PROMETHEUS_EXTERNAL,--prometheus-external'
)

for v in ${flags[@]}; do
	env=$(echo $v | cut -d',' -f1)
	flag=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params ${flag}"
done

# Runtime Options
options=(
	'VALIDATOR_BASE_PATH,--base-path'
	'VALIDATOR_CHAIN,--chain'
	'VALIDATOR_NAME,--name'
	'VALIDATOR_IN_PEERS,--in-peers'
	'VALIDATOR_OUT_PEERS,--out-peers'
	'VALIDATOR_MAX_PARALLEL_DOWNLOAD,--max-parallel-downloads'
	'VALIDATOR_PUBLIC_ADDR,--public-addr'
	'VALIDATOR_BOOT_NODES,--bootnodes'
)

for v in ${options[@]}; do
	env=$(echo $v | cut -d',' -f1)
	option=$(echo $v | cut -d',' -f2)
	[ x${!env} != "x" ] && params="$params $option ${!env}"
done

/usr/local/bin/polkadot $params $@
