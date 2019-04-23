FROM  nodered/node-red-docker:slim-v10
LABEL maintainer="Ronald Ham <ronald.ham@surfnet.nl"

# install NODE_RED supplements
RUN npm install node-red-contrib-amqp
RUN npm install node-red-dashboard

#COPY settings.js /data/settings.js

STOPSIGNAL SIGTERM

