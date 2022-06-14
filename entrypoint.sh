#!/bin/bash
echo "#########################"
echo "Install headers..."
echo ""

apt-get install -y linux-headers-$(uname -r)

echo "#########################"
echo ""
echo "Start ebpf_exporter..."
ebpf_exporter --config.file=/config/ebpf-config.yaml