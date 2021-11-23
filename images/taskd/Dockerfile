FROM alpine:3

LABEL maintainer="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.authors="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.title="taskd"
LABEL org.opencontainers.image.description="Taskserver docker img: https://github.com/GothenburgBitFactory/taskserver"
LABEL org.opencontainers.image.url="https://quay.io/brokenpip3/taskd"
LABEL org.opencontainers.image.source="https://www.github.com/brokenpip3/my-dockerfiles"
LABEL org.opencontainers.image.base.name="docker.io/alpine:3"

RUN addgroup -S taskd \
    && adduser -S -G taskd taskd

ENV TASKDDATA /var/taskd

RUN set -x \
    && apk add --no-cache ca-certificates taskd taskd-pki \
    && mkdir -p /var/taskd \
    && chown -R taskd:taskd /var/taskd
VOLUME /var/taskd
WORKDIR /var/taskd

USER taskd

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 53589
CMD ["taskd", "server"]
