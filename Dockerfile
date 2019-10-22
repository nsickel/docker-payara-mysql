FROM payara/server-full
MAINTAINER Nils Sickel  nils.sickel@gmail.com
USER root
RUN \
  apt-get update \
  && apt-get -y install gettext-base curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY create_jdbc_elements.sh ${PAYARA_PATH}/create_jdbc_elements.sh
COPY entrypoint.sh ${PAYARA_PATH}/entrypoint.sh

RUN \
  mkdir -p /opt/payara41/glassfish/domains/domain1/lib/ext/ \
  && curl -o mysql-connector.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.41/mysql-connector-java-5.1.41.jar \
  && mv mysql-connector.jar /opt/payara41/glassfish/domains/domain1/lib/ext/mysql-connector.jar

USER payara

ENTRYPOINT ["/opt/payara41/entrypoint.sh"]
