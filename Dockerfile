FROM alpine

# set working directory
WORKDIR /usr/local/bin

COPY awesomescript.sh myawesomescript.sh

ARG MONGO_HOST
ARG MONGO_PORT
ARG MONGO_USER
ARG MONGO_PASSWORD
ARG AUTH_DB
ARG ACCESS_KEY_ID
ARG SECRET_ACCESS_KEY
ARG DEFAULT_REGION
ARG ENDPOINT
ARG BUCKET_NAME
ARG BUCKET_PATH
ARG KEEP_OLD_FILES_DAYS=7
ARG TZ=Europe/Rome

RUN chmod +x myawesomescript.sh

RUN apk add bash

RUN echo "Install System dependencies" && \
    apk add --update

RUN apk add --no-cache tzdata

RUN echo "Install MongoDB dependencies" && \
    apk add \
    mongodb-tools

RUN echo "Install Curl as dependency" && \
    apk add \
    curl

RUN echo "Install aws-cli" && \
    apk add \ 
    --update py-pip groff less mailcap \
    && pip install awscli

RUN rm /var/cache/apk/*

CMD /usr/local/bin/myawesomescript.sh
