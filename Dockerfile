FROM node:8.9.4

# https://download.docker.com/linux/static/stable/x86_64/
ENV DOCKER_VERSION 17.12.0-ce

# https://pypi.python.org/pypi/awscli
ENV AWS_CLI_VERSION 1.14.29

# https://download-chromium.appspot.com/
ENV CHROME_VERSION 530821

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
 && unzip chrome-linux.zip -d /opt \
 && rm chrome-linux.zip \
 \
 && rm -rf /var/lib/apt /var/cache/apt
