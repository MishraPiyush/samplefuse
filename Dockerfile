FROM jboss/base-jdk:8
MAINTAINER Piyush Mishra
ENV DEPLOY_LOCAL_STORAGE=install
RUN cat /etc/redhat-release
RUN whoami
USER root
RUN whoami
RUN echo "8.8.8.8" > /etc/resolv.conf
#RUN yum update
RUN yum -y install wget
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
