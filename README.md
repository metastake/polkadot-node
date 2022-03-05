# Polkadot-node / Kusama-node

We're here at [MetaStake](https://metastake.cc) running Validator-as-a-Service, Stake-as-a-Service by using Kubernetes on Clouds.

This is the automatic docker build pipeline for [Polkadot and Kusama](https://github.com/paritytech/polkadot).

Released tags can be found [here](https://hub.docker.com/r/metastake/polkadot-node).

[![License](https://img.shields.io/github/license/metastake/polkadot-node)](/LICENSE)
[![Gitlab pipeline status](https://img.shields.io/gitlab/pipeline-status/metastake/polkadot-node?branch=main)](https://gitlab.com/metastake/polkadot-node/-/pipelines)
[![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/metastake/polkadot-node?sort=date)](https://hub.docker.com/r/metastake/polkadot-node)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/metastake/polkadot-node?arch=amd64&sort=date)](https://hub.docker.com/r/metastake/polkadot-node)
[![Docker](https://img.shields.io/docker/pulls/metastake/polkadot-node)](https://hub.docker.com/r/metastake/polkadot-node)

# Flags and Options as Environment variables

| Flags / Options          | Environment Variable            |
|--------------------------|---------------------------------|
| --validator              | VALIDATOR_ENABLED               |
| --discover-local         | VALIDATOR_DISCOVER_LOCAL        |
| --unsafe-rpc-external    | VALIDATOR_UNSAFE_RPC_EXTERNAL   |
| --prometheus-external    | VALIDATOR_PROMETHEUS_EXTERNAL   |
| --base-path              | VALIDATOR_BASE_PATH             |
| --chain                  | VALIDATOR_CHAIN                 |
| --name                   | VALIDATOR_NAME                  |
| --in-peers               | VALIDATOR_IN_PEERS              |
| --out-peers              | VALIDATOR_OUT_PEERS             |
| --max-parallel-downloads | VALIDATOR_MAX_PARALLEL_DOWNLOAD |
| --public-addr            | VALIDATOR_PUBLIC_ADDR           |
| --bootnodes              | VALIDATOR_BOOT_NODES            |
