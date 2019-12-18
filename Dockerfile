FROM continuumio/miniconda3:4.7.12 
LABEL maintainer="yannc@jfrog.com"

ENV BUILD_NAME='test_python'
ENV BUILD_NUMBER=1 

ENV ARTY_URL='http://192.168.41.41:8081/artifactory'
ENV ARTY_USER='admin'
ENV ARTY_APIKEY='AKCp5btpCwjQnQr3QSZv7XK7i7W7Yf1BXyzdXqsUKPePDHqYE3HLDPHdF9F7spexvso3sNJSN'
ENV ARTY_MAIN_REPO='asgardian-pypi'
ENV ARTY_ID='art6'

WORKDIR /tmp/

RUN apt-get install -y curl 

RUN curl -fL https://getcli.jfrog.io | sh &&  chmod 755 jfrog &&  mv jfrog /usr/local/bin/

COPY scripts/build.sh scripts/init.sh *.py requirements.txt /tmp/
COPY files/ /tmp/files/
COPY displayjson/ /tmp/displayjson/

RUN chmod u+x /tmp/build.sh /tmp/init.sh

RUN /tmp/init.sh -r $ARTY_MAIN_REPO -s $ARTY_ID

ENTRYPOINT ["/bin/bash", "-c", "/tmp/build.sh -i $BUILD_NAME -n $BUILD_NUMBER -t release -r $ARTY_MAIN_REPO -a $ARTY_ID -m python-module"]

