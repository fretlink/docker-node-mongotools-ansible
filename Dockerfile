FROM node:14.0.0-stretch

WORKDIR /app

# Install Mongo repository 4.0
RUN curl -sSL https://www.mongodb.org/static/pgp/server-4.0.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# Install Mongo, python and libpq
RUN apt-get update
RUN apt-get install -y mongodb-org-tools mongodb-org-shell \
        python3-pip python-dev libffi-dev libssl-dev libpq5 libpq-dev \
        && apt-get -y --purge remove python-cffi \
        && pip3 install --upgrade cffi setuptools

# Install Ansible
RUN pip3 install 'ansible>=2.8,<2.9'

# Install modern Ruby
RUN cd /tmp && curl -LO https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.6.tar.gz && \
        tar -xf ruby-2.6.6.tar.gz && cd ruby-2.6.6 && ./configure
RUN cd /tmp/ruby-2.6.6 && make && make install

# Install Dhall
RUN curl -LO https://github.com/dhall-lang/dhall-haskell/releases/download/1.28.0/dhall-json-1.6.0-x86_64-linux.tar.bz2 && \
  tar -xf dhall-json-1.6.0-x86_64-linux.tar.bz2 && \
  mv ./bin/dhall-to-json /usr/bin
