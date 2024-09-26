# Disclaimer <br>

This is not meant to work as is but simply be a simplified template to work from to integrate Thorchain into your own custom secure infrastructure, it is important you have a robust understanding of your infrastructures security, failure to do so can lead to loss of bonded funds. <br>

By implementing custom secure infrastructures like this we can increase the security of the Thorchain network, it would take roughly 35% of nodes running custom secure infrastructure to lock down the network. <br>

You can think of this as if though the standard ENV as being multiple open-source Ethereum client implementations, where black hats can look for bugs, whereas this would introduce significantly more closed source clients, introducing security through obscurity along with a whole other layer of security. <br>

# Instructions <br>

Before deploying the docker-compose, ensure you have all the latest images by checking the pulled versions against the value in their respective values.yaml. <br>

Additionally make sure to replace the `EXTERNAL_IP: "$IP_ADDRESS"` ENV's with your IP address. <br>

## STEP1: BOND OPERATOR <br>
Bond your operator key to your node key, see: <br>
https://docs.thorchain.org/thornodes/overview/thornode-stack#thornode-keys <br>

It is recommended to use secure key management for this, the command below should serve as an example only. <br>

```
docker exec -it af9a9b6f687e thornode tx thorchain deposit 120000000 rune "bond:node_key" --from operator_key --chain-id thorchain-1 --node tcp://localhost:27147
```


## STEP2: GENERATE KEYS <br>

Firstly get your `"$NODE_PUB_KEY"` with the following 2 commands:

```
docker exec -it af9a9b6f687e thornode keys show thorchain --pubkey --keyring-backend file

docker exec -it af9a9b6f687e thornode pubkey
```


Secondly get your `"$NODE_PUB_KEY_ED25519"` with the following command:

```
docker exec -it af9a9b6f687e thornode ed25519
```

Lastly get your `"$VALIDATOR"` with the following command:

```
docker exec -it af9a9b6f687e thornode tendermint show-validator

docker exec -it af9a9b6f687e thornode pubkey --bech cons
```


Now register these keys onchain:

```
docker exec -it af9a9b6f687e thornode tx thorchain set-node-keys "$NODE_PUB_KEY" "$NODE_PUB_KEY_ED25519" "$VALIDATOR" --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file
```

Next, we you need to register your IP onchain by replacing $IP_ADDRESS with your IP and issuing the following command:

```
docker exec -it af9a9b6f687e thornode tx thorchain set-ip-address $IP_ADDRESS --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file
```

Then lastly we must instruct the network which version of thorchain we are running, like so:

```
docker exec -it af9a9b6f687e thornode tx thorchain set-version --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file
```


## STEP3: MANAGE <br>

You can send Mimir votes to the network like this:

```
docker exec -it af9a9b6f687e thornode tx thorchain mimir MAXBONDPROVIDERS 100 --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147
```