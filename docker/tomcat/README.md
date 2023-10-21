# Create a Docker image with Tomcat 9.0

Assignment:

- Create an image with expose instruction
- Create index.html file with some content and compress it to war
- Create dockerfile
- Build dockerfile
- Access the application from the browser

## Creating directory

`mkdir -p app`

## Creating index.html in app directory

`nvim index.html`

```html
<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8" />

    <title>Tomcat 9.0</title>
    <meta name="description" content="Tomcat 9.0" />
    <meta name="author" content="Tomcat 9.0" />
  </head>

  <body>
    <h1>Tomcat 9.0</h1>
    <p>Tomcat 9.0</p>
  </body>
</html>
```

## Compressing index.html to war

`jar -cvf app.war -C app/ .`

## Creating Dockerfile

`nvim Dockerfile`

```dockerfile
ARG TOMCAT_VERSION=9.0

FROM tomcat:${TOMCAT_VERSION}

COPY index.html /usr/local/tomcat/webapps/ROOT/index.html

WORKDIR /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
```

## Build Docker Image

`docker build --build-arg TOMCAT_VERSION=9.0 -t my-tomcat-image .`

## Tagging image as labs-tomcat

`docker tag my-tomcat-image labs-tomcat`

## Verify the Images

`docker images`

## Create a container

`docker run -d -p 8080:8080 --name tomcat-container my-tomcat-image`
