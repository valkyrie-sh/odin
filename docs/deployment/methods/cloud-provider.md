# Cloud Providers

Odin can be setup on any cloud provider, this document explains odin infra on cloud providers.

The Cloud Setup Involves 2 Technical Aspects
## Compute

#### Server (Master)
The Odin server is deployed in the cloud with a public IP. Caddy will be running as a reverse proxy, routing traffic from client requests to the Odin master running on a virtual machine. [Detailed server setup]()
!!! note "Prerequisites"
    - Caddy

#### Worker
The Odin worker is deployed as a spot instance in the cloud with a minimum persistence of 1 worker. The worker scales as resource utilization reaches the bottleneck. [Detailed worker setup]()
!!! note "Prerequisites"
    - Nix
    - Podman
    - Disk attached


## Data and Storage

#### PostgreSQL
The PostgreSQL database runs in the cloud with a public IP. This database stores all details of client requests and updates.

#### Disk
The disk should be shared between workers and contains all the packages. It is mounted to Odin workers as a data disk.
!!! note "Disk Config"
    - iops: 5000
    - throughput: 300Mbps
    - shared disk: true