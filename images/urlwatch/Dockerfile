FROM python:3.9-alpine

LABEL maintainer="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.authors="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.title="urlwatch"
LABEL org.opencontainers.image.description="Urlwatch docker img: https://github.com/thp/urlwatch"
LABEL org.opencontainers.image.url="https://quay.io/brokenpip3/urlwatch"
LABEL org.opencontainers.image.source="https://www.github.com/brokenpip3/my-dockerfiles"
LABEL org.opencontainers.image.base.name="docker.io/python:3.9-alpine"

ARG URLWATCH="2.23"
RUN apk --no-cache add gcc \
      libxslt-dev \
      libc-dev \
      libffi-dev \
    && addgroup -S urlwatch \
    && adduser -S urlwatch -G urlwatch

USER urlwatch
WORKDIR /home/urlwatch
RUN python3 -m venv .venv \
    && .venv/bin/pip install --disable-pip-version-check \
      urlwatch=="${URLWATCH}"
ENV PATH="$PATH:/home/urlwatch/.venv/bin"
ENTRYPOINT ["urlwatch"]
