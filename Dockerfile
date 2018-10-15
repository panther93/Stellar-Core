FROM stellar/base:latest

#MAINTAINER <panther93@protonmail.com>

ENV STELLAR_CORE_VERSION 10.0.0-685-1fc018b4

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

WORKDIR /opt/stellar/
# COPY . .

RUN ["chmod", "+x", "start.sh"]


ENTRYPOINT ./start.sh


