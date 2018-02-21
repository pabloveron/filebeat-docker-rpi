FROM alpine:latest

MAINTAINER Pablo Veron <pveron2001@gmail.com>
RUN echo $CLOUD_USER
ENV CLOUD_USER=${CLOUD_USER}
ENV CLOUD_PASS=${CLOUD_PASS}
ENV CLOUD_ID=${CLOUD_ID}

RUN apk --update add git openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN git clone https://github.com/pabloveron/filebeat-rpi.git

# RUN cd /filebeat-rpi/filebeat-6.1.1-arm7 && ./filebeat modules enable system

# VOLUME /var/log

ENTRYPOINT ["/filebeat-rpi/filebeat-6.1.1-arm7/filebeat", "-c", "/filebeat-rpi/filebeat-6.1.1-arm7/filebeat.yml"]
