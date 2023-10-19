# Install node, npm and yarn
# from https://github.com/nikolaik/docker-python-nodejs
FROM python:3.11-slim-bookworm
#FROM python:3.11-slim-bookworm as base
RUN apt update
RUN apt install -y wget gpg
RUN  echo "deb https://deb.nodesource.com/node_12.x bookworm main" > /etc/apt/sources.list.d/nodesource.list
RUN  wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - 
RUN  echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN  wget -qO- https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN   apt update
RUN  apt-get install -yqq nodejs yarn
RUN  pip install -U pip && pip install pipenv
RUN  apt-get install -y npm
RUN  npm i -g npm@^6

# Install docker, from docker website
RUN apt-get install  -yqq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN wget -qO- https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt update -yqq
RUN apt-get install -yqq docker-ce docker-ce-cli containerd.io

# Install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
