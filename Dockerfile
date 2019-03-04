FROM node:8.12.0

WORKDIR /app

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.6 main" > /etc/apt/sources.list.d/mongodb-org-3.6.list
RUN apt-get update
RUN apt-get install -y mongodb-org-tools mongodb-org-shell
RUN curl -LO https://github.com/dhall-lang/dhall-haskell/releases/download/1.20.1/dhall-json-1.20.1-x86_64-linux.tar.bz2 && \
  tar -xf dhall-json-1.20.1-x86_64-linux.tar.bz2 && \
  mv ./bin/dhall-to-json /usr/bin
