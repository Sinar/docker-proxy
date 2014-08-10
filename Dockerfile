FROM ubuntu:14.04
MAINTAINER motionman@sinarproject.org

RUN apt-get update -q
RUN apt-get upgrade -qy
RUN apt-get install -qy language-pack-en tor privoxy supervisor

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ADD etc/tor/torrc /etc/tor/torrc
ADD etc/privoxy/config /etc/privoxy/config
ADD etc/supervisor/conf.d /etc/supervisor/conf.d

EXPOSE 8118

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
