
FROM mkroli/servicemix

RUN /opt/servicemix/bin/client feature:install camel-ftp && \
    /opt/servicemix/bin/client feature:install camel-jackson && \
    /opt/servicemix/bin/client feature:install camel-restlet && \
    sleep 10



