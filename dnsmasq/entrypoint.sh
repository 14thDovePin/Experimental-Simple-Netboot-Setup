#!/bin/sh

# Write dnsmasq's configuration file.
cat <<EOF > /etc/dnsmasq.conf
# Disable DNS service.
port=0

# Set the subnet the DHCP listens to.
dhcp-range=${subnet},proxy,255.255.255.0
log-dhcp

# Configuration from https://netboot.xyz/docs/docker/dhcp

# Standard PC BIOS
dhcp-match=set:bios,60,PXEClient:Arch:00000
dhcp-boot=tag:bios,netboot.xyz.kpxe,,${pxe_server_ip}

# 64-bit x86 EFI
dhcp-match=set:efi64,60,PXEClient:Arch:00007
dhcp-boot=tag:efi64,netboot.xyz.efi,,${pxe_server_ip}

# 64-bit x86 EFI (obsolete)
dhcp-match=set:efi64-2,60,PXEClient:Arch:00009
dhcp-boot=tag:efi64-2,netboot.xyz.efi,,${pxe_server_ip}

# 64-bit UEFI for arm64
dhcp-match=set:efi64-3,60,PXEClient:Arch:0000B
dhcp-match=set:efi64-3,60,PXEClient:Arch:00011
dhcp-boot=tag:efi64-3,netboot.xyz-arm64.efi,,${pxe_server_ip}
EOF

# Start dnsmasq.
dnsmasq --no-daemon