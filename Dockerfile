FROM ubuntu:16.04

MAINTAINER  siguernstore@protonmail.com

RUN apt-get update && apt-get install -y \
	build-essential libssl-dev libboost-all-dev git libdb5.3++-dev libminiupnpc-dev wget

RUN apt-get install -y\
    python-virtualenv

RUN cd /root && wget https://github.com/galactrum/galactrum/releases/download/v1.1.5/galactrum-1.1.5-linux64.tar.gz && \
    tar -xvf galactrum-1.1.5-linux64.tar.gz && \
    rm galactrum-1.1.5-linux64.tar.gz

RUN cd /root && mv galactrum-1.1.5/bin/* /root &&\
    rm -rf galactrum-1.1.5

RUN cd /root && git clone https://github.com/galactrum/sentinel &&\
    cd sentinel &&\
    virtualenv venv &&\
    . venv/bin/activate &&\
    pip install -r requirements.txt



WORKDIR "/root"

VOLUME ["/root/.galactrum"]


ENTRYPOINT ["/root/galactrumd"]

