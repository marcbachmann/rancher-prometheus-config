# rancher-prometheus-config

A prometheus confd setup that automatically extracts all metrics of containers using labels. No configuration needed.

Just launch a new Stack in rancher.

### Usage

  1. Run container as sidekick in rancher
  2. Mount volumes of sidekick into prometheus server
```
docker run -d --name prometheus-config marcbachmann/rancher-prometheus-config
docker run -d --volumes-from prometheus-config --name prometheus prom/prometheus -config.file=/etc/prometheus/prometheus.yml
```

### What to do
- cAdvisor relabeling, currently it exports way too many labels
- Move host labels onto node_last_seen or node_boot_time events, don't add them to other containers
