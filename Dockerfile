FROM node:8.9.1

ENV DOCKER_VERSION 17.09.1-ce


RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
        python-pip python-dev iptables \
        openjdk-7-jre \
        unzip libpangocairo-1.0-0 libtk8.6 libx11-6 libx11-xcb1 libgtk-3-0 libxcomposite1 libgconf-2-4 libasound2 \
 \
 && pip install awscli \
 \
 && curl -fL -o docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" \
 && tar -xvf docker.tgz --strip-components 1 --directory /usr/local/bin/ \
 && rm docker.tgz \
 \
 && curl -sL -o chrome-linux.zip https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/519662/chrome-linux.zip \
 && unzip chrome-linux.zip -d /opt \
 && rm chrome-linux.zip \
 \
 && rm -rf /var/lib/apt /var/cache/apt
