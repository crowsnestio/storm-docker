FROM anapsix/alpine-java:jre8

MAINTAINER Josh Sorenson <josh@crowsnest.io>

RUN apk update && apk add tar curl gnupg python

RUN gpg --recv-keys E80B8FFD
RUN curl -s https://archive.apache.org/dist/storm/apache-storm-0.10.0-beta1/apache-storm-0.10.0-beta1.tar.gz.asc -o apache-storm-0.10.0-beta1.tar.gz.asc && \
    curl -s https://archive.apache.org/dist/storm/apache-storm-0.10.0-beta1/apache-storm-0.10.0-beta1.tar.gz -o apache-storm-0.10.0-beta1.tar.gz && \
    gpg --verify apache-storm-0.10.0-beta1.tar.gz.asc apache-storm-0.10.0-beta1.tar.gz && \
    tar zxf apache-storm-0.10.0-beta1.tar.gz -C /opt && \
    mv /opt/apache-storm-0.10.0-beta1 /opt/apache-storm && \
    rm apache-storm-0.10.0-beta1.tar.gz apache-storm-0.10.0-beta1.tar.gz.asc

ADD configure.sh /
