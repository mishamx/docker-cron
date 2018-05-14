FROM debian:stretch-slim

RUN apt-get update && apt-get install -y cron && rm -r /var/lib/apt/lists/*

COPY ./cron /etc/cron
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./docker-cmd.sh /docker-cmd.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/cron", "-f"]

