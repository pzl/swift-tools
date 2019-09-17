#!/bin/bash

# this file sets up your OS for launching unprivileged containers
# i.e. create and launching containers without root or sudo

if ! grep $USER /etc/subuid >/dev/null 2>&1; then
  echo "$USER:100000:65536" | sudo tee -a /etc/subuid
fi
if ! grep $USER /etc/subgid >/dev/null 2>&1; then
  echo "$USER:100000:65536" | sudo tee -a /etc/subgid
fi

if [ ! -f /etc/sysctl.d/99-unpriv-ns.conf ] || [ ! -s /etc/sysctl.d/99-unpriv-ns.conf ]; then
  echo "kernel.unprivileged_userns_clone = 1" | sudo tee -a /etc/sysctl.d/99-unpriv-ns.conf
fi
