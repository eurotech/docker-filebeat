FROM busybox

# FILEBEAT_VERSION = 5.0.1
ENV FILEBEAT_SHA1=6a38929950d510c1aa557f3ef19936644e0182d6

COPY binary/filebeat.tar.gz /tmp/filebeat.tar.gz

RUN echo "${FILEBEAT_SHA1} */tmp/filebeat.tar.gz" | sha1sum -c -

RUN mkdir /opt && tar xzvf /tmp/filebeat.tar.gz -C /opt && mv /opt/filebeat-* /opt/filebeat

RUN mkdir /etc/filebeat && mv /opt/filebeat/filebeat.* /etc/filebeat

ENTRYPOINT ["/opt/filebeat/filebeat"]

CMD [ "-e", "-c", "/etc/filebeat/filebeat.yml" ]

