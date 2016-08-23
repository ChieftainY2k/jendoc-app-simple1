#
# Creates image with application inside, for builder
#

FROM webdevops/php-apache-dev:ubuntu-15.10

COPY ./application /application

WORKDIR /application


