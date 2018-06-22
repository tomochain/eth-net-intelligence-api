FROM node:8-alpine

LABEL maintainer="etienne@tomochain.com"

WORKDIR /eniapi

ENV WS_SECRET ''
ENV CONTACT_DETAILS ''
ENV INSTANCE_NAME 'unnamed node'

COPY . /eniapi

RUN npm install -g pm2 && \
    npm install

ENTRYPOINT ["pm2", "start", "--no-daemon", "app.json"]
