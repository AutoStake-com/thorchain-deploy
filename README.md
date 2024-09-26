# Disclaimer <br>

This is not meant to work as is but simply be a simplfied template to work from to integrate thorchain into your own custom secure infrastructure, it is important you have a robust understanding of your infrastructures security, failure to do so can lead to loss of bonded funds. <br>
By implementing custom secure infrastructures like this we can increase the security of the thorchain network, it would take roughly 35% of nodes running custom secure infrastructure to lock down the network. <br>
You can think of this as if though the standatard ENV as being multiple open-source ethereum client implemenations, where black hats can look for bugs, wheras this would introduce significantly more closed source clients, introducing security through obscurity along with a whole other layer of security. <br>

# STEP1: BOND ADMIN <br>
docker exec -it af9a9b6f687e thornode tx thorchain deposit 120000000 rune "bond:NODE_ADDRESS" --from admin_address --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file



# STEP2: GENERATE KEYS <br>

docker exec -it af9a9b6f687e thornode keys show thorchain --pubkey --keyring-backend file <br>
=> <br>
docker exec -it af9a9b6f687e thornode pubkey <br>
"$NODE_PUB_KEY"


docker exec -it af9a9b6f687e thornode ed25519 <br>
"$NODE_PUB_KEY_ED25519"


docker exec -it af9a9b6f687e thornode tendermint show-validator <br>
=> <br>
docker exec -it af9a9b6f687e thornode pubkey --bech cons <br>
"$VALIDATOR"


docker exec -it af9a9b6f687e thornode tx thorchain set-node-keys "$NODE_PUB_KEY" "$NODE_PUB_KEY_ED25519" "$VALIDATOR" --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file

docker exec -it af9a9b6f687e thornode tx thorchain set-ip-address $IP_ADDRESS --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file

docker exec -it af9a9b6f687e thornode tx thorchain set-version --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file



# STEP3: MANAGE <br>

docker exec -it af9a9b6f687e thornode tx thorchain deposit 120000000 rune "bond:NODE_ADDRESS:BONDER_ADDRESS:2000" --from admin_address --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file

docker exec -it af9a9b6f687e thornode tx thorchain mimir MAXBONDPROVIDERS 100 --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147