
FROM mkroli/servicemix
COPY ["blueprint.xml", "/deploy/ftp-blueprint.xml"]
RUN /opt/servicemix/bin/start; until /opt/servicemix/bin/client version; do sleep 5s; done; 
RUN /opt/servicemix/bin/client feature:install camel-ftp; 
RUN /opt/servicemix/bin/client feature:install camel-jackson; 
RUN /opt/servicemix/bin/client feature:install camel-restlet;
