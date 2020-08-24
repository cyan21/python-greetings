FROM continuumio/miniconda3:4.7.12 
LABEL maintainer="yannc@jfrog.com"

ARG ARTY_URL
ARG ARTY_USER
ARG ARTY_APIKEY

ENV ART_REPO=$ARTY_MAIN_REPO
ENV URL=$ARTY_URL
ENV ARTY_ID='art'
ENV JFROG_CLI_OFFER_CONFIG=false


WORKDIR /tmp

RUN apt-get update && apt-get install -y curl jq

RUN curl -fL https://getcli.jfrog.io | sh &&  chmod 755 jfrog &&  mv jfrog /usr/local/bin/

CMD ["/bin/bash", "-c", "jfrog --version"]
