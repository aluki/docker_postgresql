ARG FROM_IMAGE=alpine
ARG FROM_TAG=edge

FROM ${FROM_IMAGE}:${FROM_TAG}

ARG PROGRAM
ARG VERSION

RUN apk add --no-cache tini ${PROGRAM}=${VERSION}

ENV CONFIG_FILE=/etc/postgresql/postgresql.conf

ENV PROGRAM=${PROGRAM}
ENV VERSION=${VERSION}

CMD ["tini", "--", "postgres", "--config-file=/etc/postgresql/postgresql.conf"]
