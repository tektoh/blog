FROM ruby:2.6.5

ARG HOME=/root
ARG APP_HOME=/app

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN echo "${TZ}" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ARG BUNDLER_VERSION=2.0.2
RUN gem install bundler:${BUNDLER_VERSION}

ARG NODE_VERSION="10.17.0"
RUN apt update && apt -y install \
  wget \
  python && \
  cd ~ && \
  wget https://nodejs.org/download/release/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz && \
  tar xf node-v$NODE_VERSION-linux-x64.tar.gz && \
  rm node-v$NODE_VERSION-linux-x64.tar.gz && \
  mv node-v$NODE_VERSION-linux-x64 /opt/node
ENV PATH="${PATH}:/opt/node/bin"

ARG YARN_VERSION="1.19.2"
ENV PATH ${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:${PATH}
RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version ${YARN_VERSION}

RUN apt update && apt install -y \
    fonts-liberation \
    fonts-ipafont \
    libappindicator3-1 \
    libasound2 \
    libnspr4 \
    libnss3 \
    libxss1 \
    lsb-release \
    xdg-utils && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb

ENTRYPOINT ["./docker-entrypoint.sh"]
