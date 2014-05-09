# Alfresco Community Edition 4.2.f for Docker

The container will launch a clean Alfresco Community Edition 4.2.f.

It pulls the `drwolf/alfresco-42f` container (based on Ubuntu 14.04).

## Configuration (required)

Open the `alfresco-global.properties` file and configure the database connection:

```
db.driver=com.mysql.jdbc.Driver
db.username=alfresco
db.password=
db.name=alfresco
db.url=jdbc:mysql://127.0.0.1/alfresco
```

Adapt these values to your database. The container doesn't start a MySQL server, so you need to have your.

## Build the container

`docker build -t <yourname>/alfresco-42f .`

## Run the container

`docker run -d <yourname>/alfresco-42f`

## Mount folders from the host

It could be very useful to mount the `alf_data` folder from the host. To do so use the `alf_data` folder you can find in the `templates` folder.

Find the path of the folder, e.g. `/home/myuser/docker-alfresco/templates/alf_data`, and run the container:

`docker run -d -v /home/myuser/docker-alfresco/templates/alf_data:/opt/alfresco-4.2.f/alf_data <yourname>/alfresco-42f`

You can also mount other useful folders, like `/opt/alfresco-4.2.f/tomcat/logs/`
## Credits

This repository is managed by Dr Wolf srl http://www.drwolf.it
