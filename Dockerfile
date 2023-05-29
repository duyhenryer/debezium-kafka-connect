# https://strimzi.io/docs/operators/latest/full/deploying.html#creating-new-image-from-base-str
# Download the plugin with jar: https://repo1.maven.org/maven2/io/debezium/

FROM quay.io/strimzi/kafka:0.29.0-kafka-3.2.0

ARG DEBEZIUM_CONNECTOR_VERSION=1.9.7
USER root:root
# Create the target directory
RUN mkdir -p /opt/kafka/plugins/debezium-connector-postgres
RUN ls - al /opt/kafka/plugins
# Connector plugin debezium-connector-mysql
RUN curl -O https://repo1.maven.org/maven2/io/debezium/debezium-connector-postgres/${DEBEZIUM_CONNECTOR_VERSION}.Final/debezium-connector-postgres-${DEBEZIUM_CONNECTOR_VERSION}.Final-plugin.tar.gz | \
    tar -xzf debezium-connector-postgres-${DEBEZIUM_CONNECTOR_VERSION}.Final-plugin.tar.gz -C /opt/kafka/plugins/debezium-connector-postgres && \
    rm -vf /opt/kafka/plugins/debezium-connector-postgres-${DEBEZIUM_CONNECTOR_VERSION}.Final-plugin.tar.gz

USER 1001
