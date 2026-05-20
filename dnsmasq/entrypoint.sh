#!/bin/sh

# Pick the proper binary files.
if [ $bios_file == "standard" ]; then
  bios_filename=netboot.xyz.kpxe
fi

if [ $bios_file == "hardware-native" ]; then
  bios_filename=netboot.xyz-undionly.kpxe
fi

if [ $bios_file == "legacy" ]; then
  bios_filename=netboot.xyz-legacy.kpxe
fi

if [ $uefi_file == "standard" ]; then
  uefi_filename=netboot.xyz.efi
fi

if [ $uefi_file == "hardware-native" ]; then
  uefi_filename=netboot.xyz-snp.efi
fi

if [ $uefi_file == "hardware-native-forced" ]; then
  uefi_filename=netboot.xyz-snponly.efi
fi

if [ $uefi_file == "legacy" ]; then
  uefi_filename=netboot.xyz-legacy.efi
fi

# Write dnsmasq's configuration file.
cat <<EOF > /etc/dnsmasq.conf
# Disable DNS, we only want DHCP/PXE
port=0

# Log strictly for debugging
log-dhcp

# Remove the delay since the initial DHCP link configuration is succeeding
# dhcp-reply-delay=2

# Define proxy mode for your local subnet
dhcp-range=${subnet},proxy,${subnet_mask}

# The Golden Ticket for ProxyDHCP: pxe-service
# pxe-service=x86PC,"Boot netboot.xyz (BIOS)",netboot.xyz.kpxe,${pxe_server_ip}
# pxe-service=x86-64_EFI,"Boot netboot.xyz (UEFI)",netboot.xyz.efi,${pxe_server_ip}
# pxe-service=BC_EFI,"Boot netboot.xyz (UEFI Alt)",netboot.xyz.efi,${pxe_server_ip}
pxe-service=x86PC,"Boot netboot.xyz (BIOS)",${bios_filename},${pxe_server_ip}
pxe-service=x86-64_EFI,"Boot netboot.xyz (UEFI)",${uefi_filename},${pxe_server_ip}
pxe-service=BC_EFI,"Boot netboot.xyz (UEFI Alt)",${uefi_filename},${pxe_server_ip}

# Fallback/Override safety
dhcp-no-override
EOF

# Start dnsmasq.
dnsmasq --no-daemon