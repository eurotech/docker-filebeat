FROM alpine:3.8

ENV FILEBEAT_SOURCE=https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.5.1-linux-x86_64.tar.gz

RUN apk add libc6-compat \
  && wget "${FILEBEAT_SOURCE}" -O /tmp/filebeat.tar.gz \
  && mkdir -p /tmp/filebeat /usr/share/filebeat /etc/filebeat/modules.d /var/lib/filebeat \
  && tar zxf /tmp/*.tar.gz -C /tmp/filebeat --strip-components=1 \
  && mv /tmp/filebeat/filebeat /usr/local/filebeat \
  && mv /tmp/filebeat/module /usr/share/filebeat/module \
  && rm -rf /tmp/filebeat*

COPY filebeat.yml /etc/filebeat/filebeat.yml

VOLUME ["/var/lib/filebeat"]

ENTRYPOINT ["/usr/local/filebeat"]

CMD [ "-e", "-c", "/etc/filebeat/filebeat.yml" ]
