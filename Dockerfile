# Use the buildsystem image made for android.
# Has make and everything inbuilt

FROM baalajimaestro/android-build:latest

WORKDIR /app

COPY build.sh /app
COPY openwrt_config /app

CMD ["bash", "build.sh"]
