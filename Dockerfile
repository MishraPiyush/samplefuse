
FROM mkroli/servicemix

RUN /opt/servicemix/bin/start & \
     sleep 30 && \
    /opt/servicemix/bin/client feature:install camel-ftp && \
    /opt/servicemix/bin/client feature:install camel-jackson && \
    /opt/servicemix/bin/client feature:install camel-restlet && \
    /opt/servicemix/bin/client shutdown -f && \
    sleep 10



