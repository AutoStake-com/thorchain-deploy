# STEP1: BOND ADMIN <br>
docker exec -it af9a9b6f687e thornode tx thorchain deposit 120000000 rune "bond:NODE_ADDRESS" --from admin_address --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file



# STEP2: GENERATE KEYS <br>

docker exec -it af9a9b6f687e thornode keys show thorchain --pubkey --keyring-backend file
=>
docker exec -it af9a9b6f687e thornode pubkey
"$NODE_PUB_KEY"


docker exec -it af9a9b6f687e thornode ed25519
"$NODE_PUB_KEY_ED25519"


docker exec -it af9a9b6f687e thornode tendermint show-validator
=>
docker exec -it af9a9b6f687e thornode pubkey --bech cons
"$VALIDATOR"


docker exec -it af9a9b6f687e thornode tx thorchain set-node-keys "$NODE_PUB_KEY" "$NODE_PUB_KEY_ED25519" "$VALIDATOR" --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file

docker exec -it af9a9b6f687e thornode tx thorchain set-ip-address $IP_ADDRESS --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file

docker exec -it af9a9b6f687e thornode tx thorchain set-version --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file



# STEP3: MANAGE <br>

docker exec -it af9a9b6f687e thornode tx thorchain deposit 120000000 rune "bond:NODE_ADDRESS:BONDER_ADDRESS:2000" --from admin_address --chain-id thorchain-1 --node tcp://localhost:27147 --keyring-backend file

docker exec -it af9a9b6f687e thornode tx thorchain mimir MAXBONDPROVIDERS 100 --from thorchain --chain-id thorchain-1 --node tcp://localhost:27147