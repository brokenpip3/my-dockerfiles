FROM ubuntu:latest

LABEL maintainer="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.authors="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.title="ubuntu-toolbox"
LABEL org.opencontainers.image.description="Ubuntu fresh from latest lts + git curl jq"
LABEL org.opencontainers.image.url="https://quay.io/brokenpip3/ubuntu-toolbox"
LABEL org.opencontainers.image.source="https://www.github.com/brokenpip3/my-dockerfiles"
LABEL org.opencontainers.image.base.name="docker.io/ubuntu:latest"

RUN apt update && apt install -y \
  git \
  curl \
  jq \
  && rm -rf /var/lib/apt/lists/* \
  && useradd -rms /bin/bash toolbox

USER toolbox
WORKDIR /home/toolbox

ENTRYPOINT ["/usr/bin/bash"]
