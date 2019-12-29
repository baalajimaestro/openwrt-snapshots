git clone https://github.com/openwrt/openwrt
cd openwrt
./scripts/feeds update -a && ./scripts/feeds install -a
cp ../openwrt_config .config
make -j$(nproc)
