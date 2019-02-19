FROM mkroli/servicemix
COPY ["ftp-blueprint.xml", "/opt/servicemix/deploy/ftp-blueprint.xml"]
WORKDIR /opt/servicemix
RUN /opt/servicemix/bin/start
RUN sleep 20
RUN bin/client feature:install camel-restlet
