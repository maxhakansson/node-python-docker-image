FROM python:2.7

RUN \
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
  apt-get install -y nodejs build-essential

RUN /usr/local/bin/npm install -g bower gulp

RUN echo "deb http://http.debian.net/debian wheezy main" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y gettext zip
