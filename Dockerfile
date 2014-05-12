FROM drwolf/alfresco-42f
MAINTAINER tommaso.visconti@drwolf.it

ADD alfresco-global.properties /opt/alfresco-4.2.f/tomcat/shared/classes/alfresco-global.properties

# Change root password (set your own)
RUN echo 'root:s3cr3t' | chpasswd

EXPOSE 22 8080
CMD ["/usr/bin/supervisord"]
