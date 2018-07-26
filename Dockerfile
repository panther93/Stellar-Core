FROM stellar/base:latest

#MAINTAINER <panther93@protonmail.com>

ENV STELLAR_CORE_VERSION 9.2.0-551-7561c1d5

#stellar-core command port
EXPOSE 11626 
#stellar-core peer port
EXPOSE 11625
#postgres port
EXPOSE 5432
#horizon port
EXPOSE 8000

RUN apt-get update && apt-get install -y curl git libpq-dev libsqlite3-dev libsasl2-dev postgresql-client postgresql postgresql-contrib sudo vim zlib1g-dev supervisor&& \
  apt-get clean && \
  wget -O stellar-core.deb https://s3.amazonaws.com/stellar.org/releases/stellar-core/stellar-core-${STELLAR_CORE_VERSION}_amd64.deb && \
  dpkg -i stellar-core.deb && \
  rm stellar-core.deb

VOLUME [ "/opt/stellar/core" ]

WORKDIR /opt/stellar/core 

ADD start.sh .
RUN ["chmod", "+x", "start.sh"]
#CMD "/opt/stellar/core/start.sh"
ENTRYPOINT start.sh
# ENTRYPOINT ["/usr/local/bin/stellar-core"]




