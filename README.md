# ebpf_exporter in Docker
This repository provides Dockerfiles which can be used to build an image with 
[bcc](https://github.com/iovisor/bcc) v.0.22.0 and [ebpf_exporter](https://github.com/cloudflare/ebpf_exporter) v.1.2.5 for different versions of Ubuntu.

Currently supported:

- Ubuntu 18.04 (bionic)
    - `Dockerfile.bionic`
- Ubuntu 20.04 (focal)
    - `Dockerfile.focal`

You can also used prebuilt container images:
- [srnbckr/ebpf_exporter:bionic](https://hub.docker.com/repository/docker/srnbckr/ebpf_exporter)
- [srnbckr/ebpf_exporter:focal](https://hub.docker.com/repository/docker/srnbckr/ebpf_exporter)

## Build image
`docker build . -t ebpf_exporter -f Dockerfile.focal`

## Run container
Create ebpf_exporter config as `ebpf-config.yaml` in a `config` folder.

```sh
sudo docker run -v ${PWD}/config:/config \
    --privileged \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /sys/kernel/debug:/sys/kernel/debug:ro \
    -v /lib/modules:/lib/modules:ro \
    -p 9435:9435 \
    -it \
    ebpf_exporter
```

Or use the provided `start.sh` script:

```sh
sudo ./start.sh
```

**Note** This runs a docker container with extended privileges, which might be a [bad idea](https://www.trendmicro.com/en_us/research/19/l/why-running-a-privileged-container-in-docker-is-a-bad-idea.html). 


## Test container
Open `http://localhost:9345` in a browser.

## TODO
- [ ] Create example Kubernetes manifest
- [ ] Create helm chart to run ebpf_exporter as a daemonset


