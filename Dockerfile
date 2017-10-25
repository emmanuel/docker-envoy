FROM lyft/envoy:latest
MAINTAINER Emmanuel Gomez "emmanuel.gomez@nordstrom.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -qy update \
 && apt-get -qy install \
      ca-certificates \
      iptables \
      curl

# for transparent redirection we need a distinct user for envoy to run as
RUN useradd --create-home --shell /bin/bash envoy
USER envoy
WORKDIR /
