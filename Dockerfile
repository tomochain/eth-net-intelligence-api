FROM node:8-alpine

LABEL maintainer="etienne@tomochain.com"

WORKDIR /netstats

ENV WS_SECRET ''
ENV CONTACT_DETAILS ''
ENV INSTANCE_NAME 'unnamed node'

RUN npm install \
    && npm install -g pm2

COPY . .

ENTRYPOINT ["pm2", "start", "--no-daemon", "app.json"]
