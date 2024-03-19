#FROM docker.elastic.co/logstash/logstash:8.9.0
FROM docker.elastic.co/logstash/logstash:8.12.2
# delete default configuration
RUN rm -f /usr/share/logstash/pipeline/logstash.conf

# copy configurations
COPY logstash/pipeline/ /usr/share/logstash/pipeline/
COPY logstash/config/ /usr/share/logstash/config/

USER 0
RUN mkdir -p /var/log/logstash
RUN chown logstash:root /var/log/logstash

USER $CONTAINER_USER_ID
# Remove the default log4j2.properties file and copy the custom one to the container
RUN rm -f /usr/share/logstash/config/log4j2.properties
COPY --chmod=644 logstash/config/log4j2.properties /usr/share/logstash/config
# RUN chown logstash:root /usr/share/logstash/config/log4j2.properties

WORKDIR /usr/share/logstash/

EXPOSE 9600 5044 8080