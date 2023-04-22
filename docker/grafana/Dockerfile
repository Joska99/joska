FROM grafana/grafana:8.3.0

# Add plugins
ENV GF_INSTALL_PLUGINS=grafana-simple-json-datasource

# Copy a config file from your working directory
COPY grafana.ini /etc/grafana/grafana.ini