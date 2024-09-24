# https://gitlab.com/thorchain/devops/node-launcher/-/blob/master/scripts/check-thornode-images.sh?ref_type=heads
# https://gitlab.com/thorchain/devops/node-launcher/-/blob/master/thornode-stack/mainnet.yaml?ref_type=heads
FROM registry.gitlab.com/thorchain/thornode:mainnet-2.135.0@sha256:efbaeeafa6aca1d335f52e38b87f9a800723bacdfaeccfda8fa1ab20f4fb568d

# Add custom configs
ADD run-bifrost.sh /scripts/run-bifrost.sh
RUN chmod +x scripts/run-bifrost.sh
