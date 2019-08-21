FROM nginx:1.17-alpine as base

MAINTAINER Simon DENEL, simondenel1@gmail.com

# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
ARG TIME_ZONE

RUN apk add curl
RUN mkdir -p /mnt/data/
RUN curl --fail-early -o /mnt/data/xl https://dist.xebialabs.com/public/xl-cli/9.0.2/linux-amd64/xl

# Logs to stdout / stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

COPY default.conf /etc/nginx/conf.d/

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
