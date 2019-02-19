
FROM mkroli/servicemix
RUN /opt/servicemix/bin/start; until /opt/servicemix/bin/client version; do sleep 5s; done;/opt/servicemix/bin/client feature:install camel-ftp; /opt/servicemix/bin/client feature:install camel-jackson;/opt/servicemix/bin/client feature:install camel-restlet;
