FROM openjdk:17-jdk-alpine

ARG saxon_ver=9.9.1-8

RUN apk add --no-cache libxml2-utils wget unzip

ADD \
  https://repo1.maven.org/maven2/net/sf/saxon/Saxon-HE/${saxon_ver}/Saxon-HE-${saxon_ver}.jar \
  /java/saxon.jar

WORKDIR /src

ADD bin /bin

RUN chmod a+x /bin/* \
 && chmod a+r -R /bin
