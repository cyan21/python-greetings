FROM continuumio/miniconda3:4.7.12 
LABEL maintainer="yannc@jfrog.com"

WORKDIR /tmp/

RUN apt-get install -y curl 

RUN curl -fL https://getcli.jfrog.io | sh &&  chmod 755 jfrog &&  mv jfrog /usr/local/bin/
RUN chmod 777 -R /opt/conda/lib/python3.7/site-packages/

CMD ["/bin/bash"]

