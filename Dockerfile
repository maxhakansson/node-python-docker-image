FROM python:2.7

RUN \
  apt-get update && \
  apt-get install -y curl apt-transport-https ca-certificates && \
  curl --fail -ssL -o setup-nodejs https://deb.nodesource.com/setup_6.x && \
  bash setup-nodejs && \
  apt-get install -y nodejs build-essential

RUN /usr/local/bin/npm install -g bower gulp

RUN echo "deb http://http.debian.net/debian wheezy main" > /etc/apt/sources.list

RUN apt-get install -y gettext zip
