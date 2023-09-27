FROM redis:latest

# Install cron
RUN apt-get update && \
  apt-get install -y cron nano && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure redis
RUN mkdir -p /var/log/redis && touch "/var/log/redis/redis-server.log"

RUN mkdir -p /etc/redis && echo "logfile /var/log/redis/redis-server.log" >> /etc/redis/redis.conf

# Copy the script that will monitor the Redis log
COPY monitor-redis-log.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/monitor-redis-log.sh

# Set up the cron job
RUN echo "*/5 * * * * /usr/local/bin/monitor-redis-log.sh" | crontab -

# Start Redis and cron
CMD ["sh", "-c", "service cron start && redis-server"]
