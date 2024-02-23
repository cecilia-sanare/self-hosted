## Self Hosted Services

### Prerequisites

- [Rancher Desktop](https://rancherdesktop.io/)

### Getting Started

```sh
# Start all the services
docker compose up -d
# Create a user for Pterodactyl Panel
docker compose exec -it panel php artisan p:user:make
```

After `wings` starts up modify the [config.yml](data/pterodactyl/wings/etc/config.yml) to contain the following:

```yml
# ...
docker:
  network:
    # ...
    name: host
    network_mode: host
    driver: host
```

This will ensure it binds the ports to your host machine rather then a subnet.

**Linux Only**

Allow running apps on lower port ranges without sudo:

```sh
sudo sysctl -w net.ipv4.ip_unprivileged_port_start=0
```