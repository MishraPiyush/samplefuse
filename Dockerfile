FROM jboss/base:latest
MAINTAINER Piyush Mishra
ENV DEPLOY_LOCAL_STORAGE=install
USER root
RUN yum -y install java-1.8.0-openjdk-devel && yum clean all
USER jboss
RUN whoami
RUN sleep 5
ENV DEPLOY_CLOUD_STORAGE=http://www.apache.org/dyn/closer.lua/servicemix/servicemix-6/6.1.4/apache-servicemix-6.1.4.zip
ENV SERVICEMIX_VERSION=
RUN wget $DEPLOY_CLOUD_STORAGE 
WORKDIR /opt/servicemix
RUN unzip apache-servicemix-6.1.4.zip -d /opt/servicemix && rm *.zip
RUN ln -s "/opt/apache-servicemix-6.1.4" /opt/servicemix
RUN sed -i 's//#admin/admin/' etc/user.properties
RUN bin/karaf server & \
sleep 10 && \
bin/client feature:install camel-ftp && \
bin/client feature:install camel-jackson && \
bin/client feature:install camel-restlet && \
sleep 10 && \
bin/client 'shutdown -f' && \
sleep 5
EXPOSE 8181 8101 61616 61617 8883
