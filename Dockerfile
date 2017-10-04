FROM alpine:3.6

ENV FILEBEAT_SOURCE=https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.6.2-linux-x86_64.tar.gz

ADD ${FILEBEAT_SOURCE} /tmp

RUN mkdir -p /opt/filebeat && mkdir /etc/filebeat \
  && tar zxf /tmp/*.tar.gz -C /opt/filebeat --strip-components=1 \
  && mv /opt/filebeat/filebeat.yml /etc/filebeat/filebeat.yml \
  && rm -rf /tmp/*.tar.gz

ENTRYPOINT ["/opt/filebeat/filebeat"]

CMD [ "-e", "-c", "/etc/filebeat/filebeat.yml" ]
