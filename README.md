# Alfresco Community Edition 4.2.f for Docker

The container will launch Alfresco Community Edition 4.2.f.

It pulls the `drwolf/alfresco-42f` container (based on Ubuntu 14.04): https://index.docker.io/u/drwolf/alfresco-42f/

Alfresco Installed modules:

* Google Docs Integration
* Javascript Console

## Requirements

Alfresco is configured to use 1 GB of RAM. I suggest to give the container at leas 1.5 GB of RAM (for Alfresco and OpenOffice daemon).

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

`docker run -d -P <yourname>/alfresco-42f`

The container will start the supervisor daemon which launches SSH server and Alfresco.
With the `-P` option, the 22 and 8080 ports are [automatically mapped](http://docs.docker.io/use/port_redirection/#port-redirection) to a free host's ports (in the pool 49000..49900). User `docker ps` to find the used ports.

## Mount folders from the host

It could be very useful to mount the `alf_data` folder from the host. To do so use the `alf_data` folder you can find in the `templates` folder.

Find the path of the folder, e.g. `/home/myuser/docker-alfresco/templates/alf_data`, and run the container:

`docker run -d -v /home/myuser/docker-alfresco/templates/alf_data:/opt/alfresco-4.2.f/alf_data <yourname>/alfresco-42f`

You can also mount other useful folders, like `/opt/alfresco-4.2.f/tomcat/logs/`

### Note about alf_data

The `alf_data` folder and the database must be used together. So you have do decide if mount the volume with `alf_data` before the first run of the container, or it won't work without deleting the database tables.
My suggestion is to run the container with the external `alf_data` volume on an empty database.

## SSH access

The root password is set to `s3cr3t` by the Dockerfile, set there your own password

## Alfresco and Alfresco Share access

If you used the `-P` option to launch the container, find the host's port mapped to the container's 8080 port, e.g. 49154, and point your browser to it:

* **Alfresco:** http://<HOST_IP>:<CONTAINER_PORT>/alfresco
* **Alfresco Share:** http://<HOST_IP>:<CONTAINER_PORT>/share

For both the initial username is `admin` and the password `s3cr3t`

## Credits

This repository is managed by Dr Wolf srl http://www.drwolf.it
