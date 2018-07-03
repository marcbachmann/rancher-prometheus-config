FROM alpine:3.6
RUN apk add --update curl ca-certificates bind-tools \
    && curl -L -o /usr/bin/confd https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 \
    && chmod +x /usr/bin/confd

ADD prometheus.toml /etc/confd/conf.d/prometheus.toml
ADD prometheus.yml.tmpl /etc/confd/templates/prometheus.yml.tmpl

VOLUME /etc/prometheus
CMD ["/usr/bin/confd", "--backend", "rancher", "--prefix", "/2016-07-29", "-interval", "60"]
