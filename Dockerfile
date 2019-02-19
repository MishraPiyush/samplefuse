FROM jboss/base-jdk:8
MAINTAINER Piyush Mishra
ENV DEPLOY_LOCAL_STORAGE=install
ENV DEPLOY_CLOUD_STORAGE=http://www.apache.org/dyn/closer.lua/servicemix/servicemix-6/6.1.4/apache-servicemix-6.1.4.zip
ENV SERVICEMIX_VERSION=
RUN curl $DEPLOY_CLOUD_STORAGE > /op/servicemix/apache-servicemix-6.1.4.zip
WORKDIR /opt/servicemix
RUN unzip apache-servicemix-6.1.4.zip -d /opt/servicemix && rm *.zip
RUN ln -s "apache-servicemix-6.1.4" servicemix
RUN sed -i 's//#admin/admin/' etc/user.properties
RUN bin/karaf server & \
sleep 10 && \
bin/client feature:install camel-ftp && \
bin/client feature:install camel-jackson && \
bin/client feature:install camel-restlet && 
sleep 10 && \
bin/client 'shutdown -f' && \
sleep 5
EXPOSE 8181 8101 61616 61617 8883
