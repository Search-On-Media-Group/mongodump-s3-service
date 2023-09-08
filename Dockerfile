FROM alpine

# set working directory
WORKDIR /usr/local/bin

COPY awesomescript.sh myawesomescript.sh

COPY instant.sh instant

RUN chmod +x instant
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
