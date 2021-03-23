FROM docker:20.10.3

ENV JQ_VERSION='1.5'
RUN apk add --no-cache bash curl jq python3 py3-pip nodejs=14.16.0-r0 npm git gnupg && \
    pip install awscli && \
    wget --no-check-certificate https://raw.githubusercontent.com/stedolan/jq/master/sig/jq-release.key -O /tmp/jq-release.key && \
    wget --no-check-certificate https://raw.githubusercontent.com/stedolan/jq/master/sig/v${JQ_VERSION}/jq-linux64.asc -O /tmp/jq-linux64.asc && \
    wget --no-check-certificate https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -O /tmp/jq-linux64 && \
    gpg --import /tmp/jq-release.key && \
    gpg --verify /tmp/jq-linux64.asc /tmp/jq-linux64 && \
    cp /tmp/jq-linux64 /usr/bin/jq && \
    chmod +x /usr/bin/jq && \
    rm -f /tmp/jq-release.key && \
    rm -f /tmp/jq-linux64.asc && \
    rm -f /tmp/jq-linux64 && \
    npm install --global yarn && \
    curl https://raw.githubusercontent.com/silinternational/ecs-deploy/3.9.1/ecs-deploy | tee /usr/bin/ecs-deploy && \
    chmod +x /usr/bin/ecs-deploy
