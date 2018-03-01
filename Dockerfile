FROM ubuntu:xenial
MAINTAINER "Adam Breaux" <abreaux@kbra.com>

RUN apt-get update \
  && apt-get -y install \
  apt-transport-https \
  curl

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update \
  && ACCEPT_EULA=Y apt-get -y install msodbcsql \
  && apt-get -y install unixodbc-dev \
  && apt-get -y install python-pip python-virtualenv \
  && locale-gen "en_US.UTF-8" \
  && dpkg-reconfigure locales
