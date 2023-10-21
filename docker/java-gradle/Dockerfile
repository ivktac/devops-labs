ARG JAVA_VERSION=11

FROM openjdk:${JAVA_VERSION}-jdk-slim

ARG GRADLE_VERSION=7.0.2

# See more: https://linuxize.com/post/how-to-install-gradle-on-debian-10/#downloading-gradle
RUN apt-get update && apt-get install -y --no-install-recommends unzip=6.* wget=1.20.* && rm -rf /var/lib/apt/lists/*

RUN wget -q https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip \
  && unzip gradle-${GRADLE_VERSION}-bin.zip -d /opt \
  && rm gradle-${GRADLE_VERSION}-bin.zip

ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION}
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# COPY . /app

# WORKDIR /app

CMD ["gradle", "-v"]
