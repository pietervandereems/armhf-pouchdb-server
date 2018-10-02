#FROM armhf/node:6.9-slim
FROM pietervandereems/armhf-alpine-node:8

#RUN apt-get -qq update && \
#    apt-get -y --no-install-recommends install g++ python make git wget
RUN apk add python make g++
RUN npm install --unsafe-perm -g pouchdb-server
RUN npm install --unsafe-perm -g pouchdb-adapter-leveldb
#RUN apt-get -y purge g++ make python git && \
#    apt-get -y autoremove && \
#    apt-get -y autoclean

ADD add-db-user.sh /usr/bin/add-db-user.sh
RUN chmod +x /usr/bin/add-db-user.sh

RUN mkdir /pouchdb

WORKDIR /pouchdb

CMD ["pouchdb-server", "-p", "5984", "-o", "0.0.0.0"]

