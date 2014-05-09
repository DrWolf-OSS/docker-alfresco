FROM drwolf/alfresco-42f
MAINTAINER tommaso.visconti@drwolf.it

ADD alfresco-global.properties /opt/alfresco-4.2.f/tomcat/shared/classes/alfresco-global.properties

EXPOSE 22 8080
