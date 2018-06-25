from node:8-alpine as git

WORKDIR /netapi

RUN apk update && \
    apk upgrade && \
    apk add git && \
    git clone https://github.com/cubedro/eth-net-intelligence-api . && \
    npm install

FROM node:8-alpine

LABEL maintainer="etienne@tomochain.com"

WORKDIR /netapi

ENV WS_SECRET ''
ENV CONTACT_DETAILS ''
ENV INSTANCE_NAME 'unnamed node'

RUN npm install -g pm2

COPY --from=git /netapi /netapi

ENTRYPOINT ["pm2", "start", "--no-daemon", "app.json"]
