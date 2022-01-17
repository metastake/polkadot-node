# Polkadot-node / Kusama-node

We're here at [MetaStake](https://metastake.cc) running Validator-as-a-Service, Stake-as-a-Service by using Kubernetes on Clouds.

This is the automatic docker build pipeline for [Polkadot and Kusama](https://github.com/paritytech/polkadot).

Released tags can be found [here](https://hub.docker.com/r/metastake/polkadot-node).

[![License](https://img.shields.io/github/license/metastake/polkadot-node)](/LICENSE)
[![Gitlab pipeline status](https://img.shields.io/gitlab/pipeline-status/metastake/polkadot-node?branch=main)](https://gitlab.com/metastake/polkadot-node/-/pipelines)
[![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/metastake/polkadot-node?sort=date)](https://hub.docker.com/r/metastake/polkadot-node)
[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/metastake/polkadot-node?arch=amd64&sort=date)](https://hub.docker.com/r/metastake/polkadot-node)
[![Docker](https://img.shields.io/docker/pulls/metastake/polkadot-node)](https://hub.docker.com/r/metastake/polkadot-node)

# Get Started

Create a directory to store chain database
```
$ mkdir database
```

Remember to specify the `version tag`, eg: `v0.9.15` and append `--chain kusama` if you want to run *Kusama* node.

Now run the docker container, to sync the database
```
$ docker run --rm \
              -v $(pwd)/database:/data \
              metastake/polkadot-node:v0.9.15 \
              --chain kusama -d /data
```

when data is synced, stop (Ctrl-C) the container and run another one to get sessionKeys
```
$ docker run --rm \
              -p 9933:99933 \
              -v $(pwd)/database:/data \
              metastake/polkadot-node:v0.9.15 \
              --chain kusama -d /data --unsafe-rpc-external --rpc-methods=Unsafe --validator
```

on host machine, run
```
$ curl -H "Content-Type: application/json" -d '{"id":1, "jsonrpc":"2.0", "method": "author_rotateKeys", "params":[]}' http://127.0.0.1:9933
```

Now, the validator up and running
```
$ docker run --name hydra-validator -d \
              -v $(pwd)/database:/data \
              --restart always -d \
              metastake/polkadot-node:v0.9.15 \
              --chain kusama -d /data --validator
```