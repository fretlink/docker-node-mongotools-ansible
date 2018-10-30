FROM node:8.12.0
WORKDIR /app
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/3.6 main" > /etc/apt/sources.list.d/mongodb-org-3.6.list
RUN apt-get update
RUN apt-get install -y mongodb-org-tools mongodb-org-shell python-pip python-dev libffi-dev libssl-dev && apt-get -y --purge remove python-cffi && pip install --upgrade cffi setuptools
RUN easy_install -U pip
RUN pip install ansible==2.5.4
