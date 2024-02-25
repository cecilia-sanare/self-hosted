## Self Hosted Services

### Prerequisites

- [Rancher Desktop](https://rancherdesktop.io/)

### Getting Started

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/cecilia-sanare/self-hosted/main/setup.sh)"
```

**Linux Only**

Allow running apps on lower port ranges without sudo:

```sh
sudo sysctl -w net.ipv4.ip_unprivileged_port_start=0
```