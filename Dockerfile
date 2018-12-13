##Versio 0.1
FROM ubuntu:16.04
#FROM debian:latest
MAINTAINER Ville "ville@villeton.com"
ENV GRADLE_HOME /opt/gradle-3.1
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/gradle-3.1/bin

RUN apt-get update && apt-get install -qqy default-jre && apt-get install -y curl && apt-get install -y net-tools
RUN echo 'root:screencast' | chpasswd

### add binary to docker image
RUN mkdir -p /data
ADD build/libs/pipeline-test-0.1.0.jar /data
COPY nuukey /data/
COPY start_hello.sh /data/
RUN chmod 777 /data && chmod 755 /data/start_hello.sh

EXPOSE 8080
CMD /data/start_hello.sh
