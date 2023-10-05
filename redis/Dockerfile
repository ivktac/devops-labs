FROM redis:latest

RUN apt-get update && apt-get install -y nano cron

COPY check-file.sh /usr/local/bin/check-file.sh
RUN chmod +x /usr/local/bin/check-file.sh

RUN echo "test!!!" >> /var/log/my-app.log

RUN echo "* * * * * /usr/local/bin/check-file.sh >> /var/log/cron.log 2>&1" | crontab -

CMD ["sh", "-c", "cron -f & redis-server"]
