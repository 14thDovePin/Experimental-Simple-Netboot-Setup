#### Description
- This is a simple experimental docker based PXE home server that is based on netboot.xyz.
- This setup is going to be coupled with a simple dnsmasq based DHCP server.

### Environment Variables
- `subnet` = **192.168.1.0**
- `subnet_mask` = **255.255.255.0**
- `bios_file` = **standard**
  - **standard** - Uses the default binary file. `netboot.xyz.kpxe`
  - **hardware-native** - Uses the simple network protocol binary. `netboot.xyz-undionly.kpxe`
  - **legacy** - Uses the standard legacy binary. `netboot.xyz-legacy.kpxe`
    - Useful for bugged USB drivers.
- `uefi_file` = **standard**
  - **standard** - Uses the default binary file. `netboot.xyz.efi`
  - **hardware-native** - Uses the simple network protocol binary. `netboot.xyz-snp.efi`
  - **hardware-native-forced** - Uses the simple network protocol binary **only** binary. `netboot.xyz-snponly.efi`
  - **legacy** - Uses the standard legacy binary. `netboot.xyz-legacy.efi`
    - Useful for bugged USB drivers.
- `pxe_server_ip` = **192.168.1.201**