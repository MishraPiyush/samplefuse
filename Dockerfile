
FROM mkroli/servicemix
RUN until /opt/servicemix/bin/client feature:install camel-ftp do sleep 5s; 
RUN /opt/servicemix/bin/client feature:install camel-jackson; 
RUN /opt/servicemix/bin/client feature:install camel-restlet;
RUN /opt/servicemix/bin/start;
