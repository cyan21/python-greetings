FROM continuumio/miniconda3:4.7.12 
LABEL maintainer="yannc@jfrog.com"

ENV BUILD_NAME='test_python'
ENV BUILD_NUMBER=1 

ENV ARTY_URL='http://192.168.41.41:8081/artifactory'
ENV ARTY_USER='admin'
ENV ARTY_TOKEN='AKCp5btpCwjQnQr3QSZv7XK7i7W7Yf1BXyzdXqsUKPePDHqYE3HLDPHdF9F7spexvso3sNJSN'
ENV ARTY_MAIN_REPO='asgardian-pypi'
ENV ARTY_ID='art6'

RUN yum install -y curl
RUN curl -fL https://getcli.jfrog.io | sh &&  chmod 755 jfrog &&  mv jfrog /usr/local/bin/
COPY build.sh init.sh /tmp/

RUN chmod u+x /tmp/build.sh /tmp/init.sh

RUN /tmp/init.sh -i $ARTY_MAIN_REPO -s $ARTY_ID 

ENTRYPOINT ["/tmp/build.sh", "-i", "$BUILD_ID", "-n","$BUILD_NUMBER", "-t", "release", "-r", "$ARTY_MAIN_REPO", "-a","$ARTY_ID","-m","python-module"]

