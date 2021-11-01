#From: https://torstenwalter.de/openshift/nginx/2017/08/04/nginx-on-openshift.html
FROM nginx:stable

LABEL maintainer="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.authors="brokenpip3 <brokenpip3@gmail.com>"
LABEL org.opencontainers.image.title="nginx-oc"
LABEL org.opencontainers.image.description="Nginx base with changes to let the image run on ocp"
LABEL org.opencontainers.image.url="https://quay.io/brokenpip3/nginx-oc"
LABEL org.opencontainers.image.source="https://www.github.com/brokenpip3/my-dockerfiles"
LABEL org.opencontainers.image.base.name="docker.io/nginx:stable"

# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx

# users are not allowed to listen on priviliged ports
RUN sed -i.bak 's/listen\(.*\)80;/listen 8080;/' /etc/nginx/conf.d/default.conf

# comment user directive as master process is run as user in OpenShift anyhow
RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf

# Add some basic troubleshooting tools
RUN apt update && apt install -y procps \
  net-tools \
  netcat \
  curl && \
  rm -rf /var/lib/apt/lists/*
RUN addgroup nginx root

EXPOSE 8080
USER nginx

# No need for entrypoint or cmd, will use the upstream one:
# CMD ["nginx" "-g" "daemon off;"]
