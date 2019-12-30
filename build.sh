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
OUT="bin/targets/ipq40xx/generic/"
FILE_NAME="openwrt-ipq40xx-generic-asus_rt-ac58u-squashfs-sysupgrade"
NEW_FILE_NAME="${FILE_NAME}-$(date +%d%m%Y).bin"
mv "${OUT}${FILE_NAME}.bin" "${OUT}${NEW_FILE_NAME}"
FILE_PATH="${OUT}${FILE_NAME}"
scp  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r $FILE_PATH baalaji20@storage.osdn.net:/storage/groups/b/ba/baalajimaestrobuilds/openwrt-snapshots/$NEW_FILE_NAME
echo "Pushed to OSDN!"
