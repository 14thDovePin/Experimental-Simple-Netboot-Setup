# Set your interface at the parent.
# See your main interface with `ip address` command.
docker network create -d macvlan \
  --subnet=192.168.1.0/24 \
  --gateway=192.168.1.1 \
  -o parent=enp2s0 \
  physical_network