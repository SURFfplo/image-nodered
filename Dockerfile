FROM nodered/node-red:latest-10-minimal
#FROM nodered/node-red-docker:slim-v10
LABEL maintainer="Ronald Ham <ronald.ham@surfnet.nl"
LABEL image="nodered"
LABEL versie="0.2"
LABEL datum="2020 03 02"

# install NODE_RED supplements
USER root
RUN apk update \
  && apk add --virtual build-dep python make g++ &&\
  npm install rhea &&\
  npm install node-red-contrib-rhea &&\
  npm install node-red-dashboard &&\
  npm install node-red-contrib-md5 &&\
  npm install node-red-contrib-soap &&\
  apk del build-dep

# install ldap system commands
RUN apk add openldap-clients \
  && rm -rf /var/cache/apk/*

USER node-red
#COPY settings.js /data/settings.js

STOPSIGNAL SIGTERM

