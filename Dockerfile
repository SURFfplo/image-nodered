FROM nodered/node-red-docker:slim-v10
LABEL maintainer="Ronald Ham <ronald.ham@surfnet.nl"

# install NODE_RED supplements
USER root
RUN apk add --virtual build-dep python make g++ &&\
  npm install node-red-contrib-amqp &&\
  npm install node-red-dashboard &&\
  npm install node-red-contrib-md5 &&\
  apk del build-dep

USER node-red
#COPY settings.js /data/settings.js

STOPSIGNAL SIGTERM

