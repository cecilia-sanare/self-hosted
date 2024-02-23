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

After `wings` starts up copy the [template.config.yml](/template.config.yml) to `./data/pterodactyl/wings/etc/config.yml` and update the following after setting up your node:

- `uuid`
- `token_id`
- `token`

**Linux Only**

Allow running apps on lower port ranges without sudo:

```sh
sudo sysctl -w net.ipv4.ip_unprivileged_port_start=0
```