# Disclaimer <br>

This is not meant to work as is but simply be a simplfied template to work from to integrate thorchain into your own custom secure infrastructure, it is important you have a robust understanding of your infrastructures security, failure to do so can lead to loss of bonded funds. <br>

By implementing custom secure infrastructures like this we can increase the security of the thorchain network, it would take roughly 35% of nodes running custom secure infrastructure to lock down the network. <br>

You can think of this as if though the standatard ENV as being multiple open-source ethereum client implemenations, where black hats can look for bugs, wheras this would introduce significantly more closed source clients, introducing security through obscurity along with a whole other layer of security. <br>

# Instructions <br>

Before deploying the docker-compose, ensure you have all the latest images by checking the pulled versions against the value in their respective values.yaml. <br>

Additionally make sure to replace the `EXTERNAL_IP: "$IP_ADDRESS"` with your IP address. <br>

## STEP1: BOND ADMIN <br>
Bond your operator key to your node key, see: https://docs.thorchain.org/thornodes/overview/thornode-stack#thornode-keys <br>

```
docker exec -it af9a9b6f687e thornode tx thorchain deposit 120000000 rune "bond:NODE_ADDRESS" --from admin_address --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file
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