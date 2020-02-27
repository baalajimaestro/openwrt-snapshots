FROM alpine:edge

RUN apk add asciidoc \
            bash \
            bc \
            binutils \
            bzip2 \
            cdrkit \
            coreutils \
            diffutils \
            findutils \
            flex \
            g++ \
            gawk \
            gcc \
            gettext \
            git \
            grep \
            intltool \
            libxslt \
            linux-headers \
            make \
            ncurses-dev \
            patch \
            perl \
            python2-dev \
            python3-dev \
            tar \
            unzip  \
            util-linux \
            wget \
            zlib-dev \
            curl \
            moreutils \
            openssh \
            sudo --no-cache

RUN sudo echo "ci ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN adduser --home /home/ci -S ci
RUN mkdir /app
RUN chown -R ci /app
RUN chmod -R 777 /app
USER ci

WORKDIR /app
COPY build.sh /app
COPY openwrt_config /app

CMD bash build.sh | ts '[%Y-%m-%d %H:%M:%S]'
