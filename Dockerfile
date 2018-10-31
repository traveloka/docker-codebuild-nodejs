# https://hub.docker.com/r/_/node/
FROM node:8.12.0

# https://download.docker.com/linux/static/stable/x86_64/
ENV DOCKER_VERSION 18.06.1-ce

# https://pypi.python.org/pypi/awscli
ENV AWS_CLI_VERSION 1.16.44

# https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2FLAST_CHANGE?alt=media
ENV CHROME_VERSION 604166

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
        python-pip python-dev iptables zip \
        openjdk-7-jre \
        unzip libpangocairo-1.0-0 libtk8.6 libx11-6 libx11-xcb1 libgtk-3-0 libxcomposite1 libgconf-2-4 libasound2 \
 \
 && pip install awscli==${AWS_CLI_VERSION} \
 \
 && curl -fL -o docker.tgz "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" \
 && tar -xvf docker.tgz --strip-components 1 --directory /usr/local/bin/ \
 && rm docker.tgz \
 \
 && curl -sL -o chrome-linux.zip https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/${CHROME_VERSION}/chrome-linux.zip \
 && ln -s /opt/chrome-linux/chrome /usr/bin/chrome \
 && unzip chrome-linux.zip -d /opt \
 && rm chrome-linux.zip \
 \
 && rm -rf /var/lib/apt /var/cache/apt
