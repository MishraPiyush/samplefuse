
FROM mkroli/servicemix
COPY ["blueprint.xml", "/deploy/ftp-blueprint.xml"]
RUN /opt/servicemix/bin/client feature:install camel-ftp; 
RUN /opt/servicemix/bin/client feature:install camel-jackson; 
RUN /opt/servicemix/bin/client feature:install camel-restlet;
RUN /opt/servicemix/bin/start; 
