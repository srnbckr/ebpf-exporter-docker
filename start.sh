#!/bin/sh

IMAGE=srnbckr/ebpf_exporter:focal

docker run -v ${PWD}/config:/config \
    --privileged \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v /sys/kernel/debug:/sys/kernel/debug:ro \
    -v /lib/modules:/lib/modules:ro \
    -p 9435:9435 \
    -it \
    $IMAGE \
    ebpf_exporter
