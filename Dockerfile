# GO-BGP Container

FROM ubuntu:bionic
MAINTAINER Javier Prieto <javier.prieto.edu@juntadeandalucia.es>

LABEL Title="GO-BGP Container" \
      Description="For use in GNS3. Expects gobgpd.conf in volume /etc/gobgp"

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y nano wget

WORKDIR /root
RUN wget https://github.com/osrg/gobgp/releases/download/v2.3.0/gobgp_2.3.0_linux_amd64.tar.gz
RUN tar zxf gobgp_2.3.0_linux_amd64.tar.gz && mv gobgp /sbin/ && mv gobgpd /sbin/
RUN mkdir /etc/gobgp

VOLUME [ "/etc/gobgp/" ]

COPY run.sh /root/


ENTRYPOINT /bin/bash /root/run.sh

