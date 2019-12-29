git clone https://github.com/openwrt/openwrt
cd openwrt
./scripts/feeds update -a &>> /dev/null
./scripts/feeds install -a &>> /dev/null
cp ../openwrt_config .config
make -j$(nproc)
