FROM mkroli/servicemix
COPY ["blueprint.xml", "/opt/servicemix/deploy/ftp-blueprint.xml"]
WORKDIR /opt/servicemix
RUN ls
RUN bin/start
#RUN ssh karaf@localhost -p 818
#RUN /opt/servicemix/bin
#RUN sleep 20
RUN sed -ie "s/featuresBoot=.*/featuresBoot=camel-restlet,camel-jackson,config,standard,region,package,kar,ssh,management,odl-l2switch-switch-ui/g" etc/org.apache.karaf.features.cfg
RUN sleep 5
