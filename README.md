## Self Hosted Services

### Prerequisites

- [Rancher Desktop](https://rancherdesktop.io/)

### Getting Started

```sh
docker-compose up -d
```

**Linux Only**

Allow running apps on lower port ranges without sudo:

```sh
sudo sysctl net.ipv4.ip_unprivileged_port_start=0
```