FROM ubuntu:18.04
MAINTAINER Mike Bertram <contact@mibexx.de>

ENV NVM_DIR "/root/.nvm"
ENV SCREEPS_DIR "/root/screeps"
ENV NODE_VERSION "12.16.1"

RUN apt-get update && apt-get -y upgrade \
 && apt-get -y install vim curl locate python-minimal build-essential

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash \
 && . "$NVM_DIR/nvm.sh" \
 && nvm install $NODE_VERSION

ENV PATH="$NVM_DIR/versions/node/v$NODE_VERSION/bin:${PATH}"

RUN mkdir -p $SCREEPS_DIR \
 && cd $SCREEPS_DIR \
 && npm install screeps

WORKDIR $SCREEPS_DIR

EXPOSE 21025 21026

ENV SCREEPS_HOST "0.0.0.0"
ENV SCREEPS_PORT "21025"
ENV SCREEPS_CLI_HOST "127.0.0.1"
ENV SCREEPS_CLI_PORT "21026"
ENV SCREEPS_PASSWORD ""
ENV STEAM_API_KEY ""

COPY ./entrypoint /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT ["/entrypoint"]
