FROM armhf/node:6.9-slim

RUN apt-get -qq update && \
    apt-get -y --no-install-recommends install g++ python make git wget
RUN npm install -g pouchdb-server
RUN apt-get -y purge g++ make python git && \
    apt-get -y autoremove && \
    apt-get -y autoclean

ADD add-db-user.sh /usr/bin/add-db-user.sh
RUN chmod +x /usr/bin/add-db-user.sh

RUN mkdir /pouchdb

WORKDIR /pouchdb

CMD ["pouchdb-server", "-p", "5984", "-o", "0.0.0.0"]

