gaiad init localnetwork

# Set the URL of the RPC server
PUBLIC_RPC="example.com:26657"

cd /root/.gaia/
# Prepare genesis file for cosmoshub-4
wget https://github.com/cosmos/mainnet/raw/master/genesis/genesis.cosmoshub-4.json.gz

gzip -d genesis.cosmoshub-4.json.gz
mv genesis.cosmoshub-4.json /root/.gaia/config/genesis.json

#Set minimum gas price & peers
sed -i 's/minimum-gas-prices = ""/minimum-gas-prices = "0.001uatom"/' /root/.gaia/config/app.toml
sed -i 's/persistent_peers = ""/persistent_peers = "6e08b23315a9f0e1b23c7ed847934f7d6f848c8b@165.232.156.86:26656,ee27245d88c632a556cf72cc7f3587380c09b469@45.79.249.253:26656,538ebe0086f0f5e9ca922dae0462cc87e22f0a50@34.122.34.67:26656,d3209b9f88eec64f10555a11ecbf797bb0fa29f4@34.125.169.233:26656,bdc2c3d410ca7731411b7e46a252012323fbbf37@34.83.209.166:26656,585794737e6b318957088e645e17c0669f3b11fc@54.160.123.34:26656,5b4ed476e01c49b23851258d867cc0cfc0c10e58@206.189.4.227:26656"/' /root/.gaia/config/config.toml

# Configure State sync
current_block_height=$(curl -s https://${PUBLIC_RPC}/status | jq -r .result.sync_info.latest_block_height)
target_block_height=$((current_block_height - 100))

# Fetch the block data for the target block height
block_data=$(curl -s "https://${PUBLIC_RPC}/block?height=$target_block_height")

# Extract the block hash
block_hash=$(echo $block_data | jq -r '.result.block_id.hash')

logt "SED Change Config Files."
sed -i -e "s/^enable = .*/enable = \"true\"/" /root/.gaia/config/config.toml
sed -i -e "s/^rpc_servers = .*/rpc_servers = \"https:\/\/${PUBLIC_RPC},https:\/\/${PUBLIC_RPC}\"/" /root/.gaia/config/config.toml
sed -i -e "s/^trust_height = .*/trust_height = \"${target_block_height}\"/" /root/.gaia/config/config.toml
sed -i -e "s/^trust_hash = .*/trust_hash = \"${block_hash}\"/" /root/.gaia/config/config.toml
sed -i -e "s/^moniker = .*/moniker = \"localnetwork\"/" /root/.gaia/config/config.toml
sed -i -e "s/^external_address = .*/external_address = \"127.0.0.1:26656\"/" /root/.gaia/config/config.toml

#Start Gaia
gaiad start --x-crisis-skip-assert-invariants