FROM continuumio/miniconda3:4.7.12 
LABEL maintainer="yannc@jfrog.com"

ARG ARTY_URL
ARG ARTY_USER
ARG ARTY_APIKEY

ARG BUILD_NAME='test_python'
ARG BUILD_NUMBER=2
ARG ARTY_MAIN_REPO='asgardian-pypi'

ENV B_NAME=$BUILD_NAME
ENV B_NUMBER=$BUILD_NUMBER
ENV URL=$ARTY_URL
ENV ARTY_ID='art'
ENV JFROG_CLI_OFFER_CONFIG=false


WORKDIR /tmp

RUN apt-get install -y curl git

RUN curl -fL https://getcli.jfrog.io | sh &&  chmod 755 jfrog &&  mv jfrog /usr/local/bin/

RUN jfrog rt c --interactive=false --url=$ARTY_URL --user=$ARTY_USER --apikey=$ARTY_APIKEY $ARTY_ID

RUN git clone https://github.com/cyan21/python-greetings.git 

WORKDIR /tmp/python-greetings

RUN chmod u+x scripts/build.sh scripts/init.sh

RUN scripts/init.sh -r $ARTY_MAIN_REPO -s $ARTY_ID

ENTRYPOINT ["bin/bash", "-c", "scripts/build.sh", "-i", "$B_NAME", "-n", "$B_NUMBER", "-t", "release", "-r", "$ARTY_MAIN_REPO", "-a", "$ARTY_ID", "-s", $URL, "-m", "python-module"]
