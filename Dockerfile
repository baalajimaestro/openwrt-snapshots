# Use the buildsystem image made for android.
# Has make and everything inbuilt

FROM baalajimaestro/android_build:latest

RUN sudo echo "ci ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -m -d /home/ci ci
RUN useradd -g ci wheel
RUN mkdir /app
RUN chown -R ci /app
RUN chmod -R 777 /app
USER ci


WORKdIR /app
COPY build.sh /app
COPY openwrt_config /app

CMD ["bash", "build.sh"]
