# https://gitlab.com/thorchain/devops/node-launcher/-/blob/master/scripts/check-thornode-images.sh?ref_type=heads
# https://gitlab.com/thorchain/devops/node-launcher/-/blob/master/thornode-stack/mainnet.yaml?ref_type=heads
# https://snapshots.ninerealms.com/snapshots?prefix=thornode
FROM registry.gitlab.com/thorchain/thornode:mainnet-2.136.0@sha256:827fc82c6cf5fd9cd6868ee0f9e785305efe93bb9369cc89628c54ef801e839f

# Add custom configs
ADD run-thornode.sh /scripts/run-thornode.sh
RUN chmod +x /scripts/run-thornode.sh
