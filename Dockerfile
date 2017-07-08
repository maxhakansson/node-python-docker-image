FROM python:2.7

RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/latest-v7.x/node-v7.10.0.tar.gz && \
  tar xvzf node-v7.10.0.tar.gz && \
  rm -f node-v7.10.0.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  echo -e '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

RUN /usr/local/bin/npm install -g bower gulp

RUN echo "deb http://http.debian.net/debian wheezy main" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y gettext
