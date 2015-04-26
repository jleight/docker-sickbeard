FROM jleight/phusion-python:2.7
MAINTAINER Jonathon Leight <jonathon.leight@jleight.com>

RUN set -x \
  && echo 'deb http://archive.ubuntu.com/ubuntu/ trusty multiverse' \
    >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y \
    git \
    python-cheetah \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

ENV APP_HOME    /opt/sickbeard
ENV APP_CONFIG  /etc/opt/sickbeard
ENV APP_DATA    /var/opt/sickbeard
ENV APP_VERSION master
ENV APP_URL     https://github.com/midgetspy/Sick-Beard.git

RUN set -x \
  && groupadd -r -g 300 sickbeard \
  && useradd -r -u 300 -g sickbeard sickbeard \
  && mkdir -p "${APP_CONFIG}" "${APP_DATA}" \
  && git clone "${APP_URL}" "${APP_HOME}" \
  && chown -R sickbeard:sickbeard "${APP_HOME}" "${APP_CONFIG}" "${APP_DATA}"

ADD sickbeard-service.sh /etc/service/sickbeard/run

EXPOSE 8081
VOLUME ["/etc/opt/sickbeard", "/var/opt/sickbeard"]
