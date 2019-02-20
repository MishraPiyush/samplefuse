FROM mkroli/servicemix
COPY ["blueprint.xml", "/deploy/blueprint.xml"]
WORKDIR /opt/servicemix
RUN ls
RUN bin/start
#RUN ssh karaf@localhost -p 818
#RUN /opt/servicemix/bin
#RUN sleep 20
RUN sed -ie "s/featuresBoot=.*/featuresBoot=camel-restlet,camel-jackson,config,standard,region,package,kar,ssh,management,odl-l2switch-switch-ui/g" etc/org.apache.karaf.features.cfg
EXPOSE 8181 8101 61616 61617 9091
RUN sleep 5
