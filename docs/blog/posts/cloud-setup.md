---
date: 2024-12-22
authors:
  - deepak
categories:
  - Document
description:
  - How to setup Odin infra on cloud
title: Setting up the Odin infra on cloud
---

# Setting up the Odin infra on cloud

You can setup Odin on platform, this document explains odin infra in cloud providers.
<!-- Adding an excerpt -->
<!-- more --> 
### The Cloud Setup Involves 2 Technical Aspects

### Compute

#### Server (Master)
The Odin server is deployed in the cloud with a public IP. Caddy will be running as a reverse proxy, routing traffic from client requests to the Odin master running on a virtual machine.
[Detailed server setup](/detailed-server-setup.md)
```
Prerequisites
- Caddy
```

#### Worker
The Odin worker is deployed as a spot instance in the cloud with a minimum persistence of 1 worker. The worker scales as resource utilization reaches the bottleneck.[Detailed worker setup](/detailed-worker-setup.md)
```
Prerequisites
- Nix
- Podman
- Disk attached
```


### Data and Storage

#### PostgreSQL
The PostgreSQL database runs in the cloud with a public IP. This database stores all details of client requests and updates.

#### Disk
The disk should be shared between workers and contains all the packages. It is mounted to Odin workers as a data disk.

```
  iops: 5000
  throughput: 300Mbps
  shared disk: true
```