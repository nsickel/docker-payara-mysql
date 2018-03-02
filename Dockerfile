FROM payara/server-full
MAINTAINER Nils Sickel  nils.sickel@gmail.com
USER root
RUN \
  apt-get update \
  && apt-get -y install gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY create_jdbc_elements.sh ${PAYARA_PATH}/create_jdbc_elements.sh
COPY entrypoint.sh ${PAYARA_PATH}/entrypoint.sh
RUN \
    chmod a+x ${PAYARA_PATH}/create_jdbc_elements.sh && \
    chmod a+x ${PAYARA_PATH}/entrypoint.sh
USER payara
RUN  curl -o /opt/payara41/glassfish/domains/domain1/lib/ext/mysql-connector.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.41/mysql-connector-java-5.1.41.jar

ENTRYPOINT ["/opt/payara41/entrypoint.sh"]
