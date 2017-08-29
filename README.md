# [rancher-prometheus-config](https://github.com/marcbachmann/rancher-prometheus-config) [![](https://img.shields.io/docker/automated/marcbachmann/rancher-prometheus-config.svg)](https://hub.docker.com/r/marcbachmann/rancher-prometheus-config)

A prometheus confd setup that automatically extracts all metrics of containers using labels. No configuration needed.

Just launch a new Stack in rancher.

### Usage

  1. Run container as sidekick in rancher
  2. Mount volumes of sidekick into prometheus server
```
docker run -d --name prometheus-config marcbachmann/rancher-prometheus-config
docker run -d --volumes-from prometheus-config --name prometheus prom/prometheus -config.file=/etc/prometheus/prometheus.yml
```

#### Add a prometheus exporter to the config

This is quite easy, you can add new exporters based on labels on services, just configure it using the labels. All the labels are optional.

- `prometheus.port`, based on that we enable the exporter
- `prometheus.job_name`, optional
- `prometheus.metrics_path`
- `prometheus.scrape_interval`
- `prometheus.scrape_timeout`
- `prometheus.label.foo`, to add a label `foo` to all metrics of that exporter

- `prometheus.metric_relabel_pattern`, only supports `cadvisor` to add `service_stack` and `service_name` labels to its' metrics based on the rancher labels.

### What to do
- Improve the relabeling of the node exporter. Add host labels onto node_last_seen or node_boot_time events
