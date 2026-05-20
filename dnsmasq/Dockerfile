# syntax=docker/dockerfile:1
FROM alpine:latest

ENV subnet=192.168.1.0
ENV subnet_mas=255.255.255.0
ENV bios_file=default
ENV uefi_file=default
ENV pxe_server_ip=192.168.1.201

COPY ./entrypoint.sh /entrypoint.sh

RUN apk update
RUN apk add dnsmasq
RUN chmod 700 /entrypoint.sh

# Shell sensitive files when edited from Windows must be processed.
RUN sed -i 's/\r$//' entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]