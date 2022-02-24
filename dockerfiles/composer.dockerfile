FROM composer:2

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

# MacOS staff group's gid is 20, so is the dialout group in alpine linux. We're not using it, let's just remove it.
RUN delgroup dialout

RUN addgroup -g ${GID} --system cristian
RUN adduser -G cristian --system -D -s /bin/sh -u ${UID} cristian

WORKDIR /var/www/html
