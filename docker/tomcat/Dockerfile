ARG TOMCAT_VERSION=9.0

FROM tomcat:${TOMCAT_VERSION}

COPY . /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]