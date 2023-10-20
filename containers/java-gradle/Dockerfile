ARG JAVA_VERSION=11

FROM openjdk:${JAVA_VERSION}

LABEL maintainer="Ivan Tkachuk"

ENV GRADLE_VERSION=7.6.3

# See more: https://linuxize.com/post/how-to-install-gradle-on-debian-10/#downloading-gradle
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp && \
  unzip -d /opt/gradle /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
  rm /tmp/gradle-${GRADLE_VERSION}-bin.zip

ENV GRADLE_HOME=/opt/gradle/gradle-${GRADLE_VERSION}
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# COPY . /usr/src/app
# WORKDIR /usr/src/app
# RUN ["gradle", "build"]

CMD [ "gradle", "--version"]
