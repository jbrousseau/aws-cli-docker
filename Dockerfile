FROM docker:19.03.8

RUN apk add --no-cache curl jq python py-pip gettext zip &&\
    pip install awscli