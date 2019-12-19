FROM continuumio/miniconda3:4.7.12 
LABEL maintainer="yannc@jfrog.com"

ENV ARTY_URL
ENV ARTY_USER
ENV ARTY_APIKEY 
ENV ARTY_ID

WORKDIR /tmp/

RUN apt-get install -y curl 

RUN curl -fL https://getcli.jfrog.io | sh &&  chmod 755 jfrog &&  mv jfrog /usr/local/bin/

RUN jfrog rt c --interactive=false \
  --url=$ARTY_URL \
  --user=$ARTY_USER \
  --apikey=$ARTY_APIKEY \
$ARTY_ID

RUN jfrog rt use $ARTY_ID

RUN chmod 777 -R /opt/conda/lib/python3.7/site-packages/

CMD ["/bin/bash"]

