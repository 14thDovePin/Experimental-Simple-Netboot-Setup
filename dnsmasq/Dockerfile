# syntax=docker/dockerfile:1
FROM alpine:latest

ENV subnet=192.168.1.0
ENV pxe_server_ip=192.168.1.201

# DHCP Ports
EXPOSE 67
EXPOSE 68

COPY ./entrypoint.sh /entrypoint.sh

RUN apk update
RUN apk add dnsmasq
RUN chmod 700 /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]