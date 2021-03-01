# quorum-proxy
Simple proxy for Chainstack quorum nodes.
The proxy adds Authorization header to all rpc/tm requests.

# CI
Docker image is built automatically on Dockerhub.

# Usage

1. Install docker
1. Spin up quorum-proxy docker container:
    ```
    # RPC_ENDPOINT - rpc enpoint of the node deployed on Chainstack
    # TM_ENDPOINT - tm endpoint of the node deployed on Chainstack
    # USERNAME, PASSWORD - basic auth credentials to access the node deployed on Chainstack

    # docker run -d --name quorum-proxy -p 8545:8545 -p 9001:9001 -e RPC_ENDPOINT=<rpc-endpoint> -e TM_ENDPOINT=<tm-endpoint> -e USERNAME=<username> -e PASSWORD=<password> chainstack/quorum-proxy
    docker run -d --name quorum-proxy -p 8545:8545 -p 9001:9001 -e RPC_ENDPOINT=nd-123-456-789.p2pify.chainstack.com -e TM_ENDPOINT=tm-api-nd-123-456-789.p2pify.chainstack.com -e USERNAME=awesome-username -e PASSWORD=awesome-password chainstack/quorum-proxy
    ```
1. Use proxy to send reuqests to the node:
    ```
    curl 'http://localhost:8545' -H 'Content-Type: application/json' -d '{"jsonrpc": "2.0","method": "eth_blockNumber","params": [],"id": 83}'
    curl 'http://localhost:9001/api'
    ```




