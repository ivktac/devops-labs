# Creating Docker Images

## Prerequisites:

- Docker installed on your machine

## Steps:

### 1. Build a Docker image with Java and Gradle

`docker build -f java-gradle/Dockerfile -t java-gradle-image --build-arg JAVA_VERSION=11 --build-arg GRADLE_VERSION=7.0.2 .`

`docker run --name java-container my-java-gradle-image`

### 2. Build a Mongo image (with volume)

`docker build -f mongo/Dockerfile -t my-mongo-image --build-arg MONGO_VERSION=4.4 --build-arg MONGO_INITDB_ROOT_USERNAME=root --build-arg MONGO_INITDB_ROOT_PASSWORD=secret .`

`docker run -d -p 27017:27017 -v ./data/db:/data/db --name mongo-container my-mongo-image`

### 3. Build a Tomcat image

`docker build -f tomcat/Dockerfile -t my-tomcat-image --build-arg TOMCAT_VERSION=9.0 .`

`docker run -d -p 8080:8080 --name tomcat-container my-tomcat-image`

### 4. Build a Postgres image (with volume)

`docker build -f postgres/Dockerfile -t my-postgres-image --build-arg POSTGRES_VERSION=13.2 --build-arg POSTGRES_USER=postgres --build-arg POSTGRES_PASSWORD=secret --build-arg POSTGRES_DB=postgres .`

`docker run -d -p 5432:5432 -v ./data/db:/var/lib/postgresql/data --name postgres-container my-postgres-image`