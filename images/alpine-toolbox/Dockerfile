FROM alpine:3

LABEL maintainer="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.authors="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.title="alpine-toolbox"
LABEL org.opencontainers.image.description="Alpine fresh + git curl jq tar"
LABEL org.opencontainers.image.url="https://quay.io/brokenpip3/alpine-toolbox"
LABEL org.opencontainers.image.source="https://www.github.com/brokenpip3/my-dockerfiles"
LABEL org.opencontainers.image.base.name="docker.io/alpine:3"

RUN apk --no-cache add \ 
   git \
   curl \
   jq \
   tar \
   && addgroup -S toolbox \
   && adduser -S toolbox -G toolbox -s "/bin/sh" 

# Alpine has already a "guest" user that could be used
# but does not contain shell directive or home folder
USER toolbox
WORKDIR /home/toolbox

ENTRYPOINT ["/bin/sh"]
