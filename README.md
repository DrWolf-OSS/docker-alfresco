# Alfresco Community Edition 4.2.f for Docker

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
