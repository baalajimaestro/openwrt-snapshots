mkdir -p /home/ci/.ssh
curl -sL -u baalajimaestro:$GH_PERSONAL_TOKEN -o /home/ci/.ssh/id_ed25519 https://raw.githubusercontent.com/baalajimaestro/keys/master/id_ed25519
chmod 600 ~/.ssh/id_ed25519
echo "SSH Keys Set!"
git clone https://github.com/openwrt/openwrt
while true; do echo "Building OpenWRT....."; sleep 120; done &
cd openwrt
./scripts/feeds update -a &>> /dev/null
./scripts/feeds install -a &>> /dev/null
cp ../openwrt_config .config
make -j$(nproc) download world
jobs
kill %1
i=$(find . | grep "sysupgrade")
echo $i
scp  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r $i baalaji20@storage.osdn.net:/storage/groups/b/ba/baalajimaestrobuilds/openwrt-snapshots/$i
echo "Pushed to OSDN!"
