
FROM mkroli/servicemix
RUN /opt/servicemix/bin/client feature:install camel-ftp; 
RUN /opt/servicemix/bin/client feature:install camel-jackson; 
RUN /opt/servicemix/bin/client feature:install camel-restlet;
RUN /opt/servicemix/bin/start; 
