ARG JAVA_VERSION=11

FROM openjdk:${JAVA_VERSION}

LABEL maintainer="Ivan Tkachuk"

ENV GRADLE_VERSION=7.6.3

RUN wget -O gradle.zip "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" && \
  unzip gradle.zip && \
  rm gradle.zip && \
  mv "gradle-${GRADLE_VERSION}" /opt/gradle && \
  ln -s /opt/gradle/bin/gradle /usr/bin/gradle


COPY gradle-demo /usr/src/app

WORKDIR /usr/src/app

RUN ["gradle", "build"]

CMD [ "gradle", "--version"]
