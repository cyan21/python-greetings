FROM continuumio/miniconda3:4.7.12 
LABEL maintainer="yannc@jfrog.com"

ENV BUILD_NAME='test_python'
ENV BUILD_NUMBER=2

ENV ARTY_URL='http://192.168.41.41:8081/artifactory'
ENV ARTY_USER='admin'
ENV ARTY_APIKEY='AKCp5btpCwjQnQr3QSZv7XK7i7W7Yf1BXyzdXqsUKPePDHqYE3HLDPHdF9F7spexvso3sNJSN'
ENV ARTY_MAIN_REPO='asgardian-pypi'
ENV ARTY_ID='art6'

WORKDIR /tmp

RUN apt-get install -y curl git

RUN curl -fL https://getcli.jfrog.io | sh &&  chmod 755 jfrog &&  mv jfrog /usr/local/bin/

RUN jfrog rt c --interactive=false --url=$ARTY_URL --user=$ARTY_USER --apikey=$ARTY_APIKEY $ARTY_ID

RUN git clone https://github.com/cyan21/python-greetings.git && pwd && ls -l

WORKDIR /tmp/python-greetings

RUN chmod u+x scripts/build.sh scripts/init.sh

RUN scripts/init.sh -r $ARTY_MAIN_REPO -s $ARTY_ID

ENTRYPOINT ["/bin/bash", "-c", "scripts/build.sh -i $BUILD_NAME -n $BUILD_NUMBER -t release -r $ARTY_MAIN_REPO -a $ARTY_ID -m python-module"]
