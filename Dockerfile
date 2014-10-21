FROM ubuntu:14.04
MAINTAINER motionman@sinarproject.org

RUN apt-get update -q && \
    apt-get upgrade -qy && \
    apt-get install -qy tor privoxy supervisor && \
    rm -rf /var/lib/apt/lists/*

ADD etc/tor/torrc /etc/tor/torrc
ADD etc/privoxy/config /etc/privoxy/config
ADD etc/supervisor/conf.d /etc/supervisor/conf.d

EXPOSE 8118

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
