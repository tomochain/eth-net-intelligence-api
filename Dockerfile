FROM node:8-alpine

LABEL maintainer="etienne@tomochain.com"

WORKDIR /netstats

ENV WS_SECRET ''
ENV CONTACT_DETAILS ''
ENV INSTANCE_NAME 'unnamed node'

COPY . .

RUN apk add --no-cache --virtual dep  git \
    && npm install \
    && npm install -g pm2 \
    && apk del dep

ENTRYPOINT ["pm2", "start", "--no-daemon", "app.json"]
