FROM mkroli/servicemix
COPY ["blueprint.xml", "/opt/servicemix/deploy/ftp-blueprint.xml"]
WORKDIR /opt/servicemix
RUN ls
RUN bin/start
#RUN ssh karaf@localhost -p 818
#RUN /opt/servicemix/bin
#RUN sleep 20
RUN bin/client -r 7 "feature:install camel-restlet";
RUN sleep 5
