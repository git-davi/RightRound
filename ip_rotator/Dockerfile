FROM debian
RUN apt -y update
RUN apt install -y \
    cron \
    openvpn \
    procps \
    gawk 

COPY scripts/rotate-ip.sh /home/rotate-ip.sh
RUN chmod 0555 /home/rotate-ip.sh

COPY scripts/rotate.cron /etc/cron.d/rotate.cron
RUN chmod 0644 /etc/cron.d/rotate.cron
RUN crontab /etc/cron.d/rotate.cron

ENTRYPOINT ["cron", "-f"]