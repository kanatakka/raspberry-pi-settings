#!/bin/bash

if [ "`whoami`" != "root" ]; then
  echo "Require root privilege"
  exit 1
fi

function main() {
  apt update && apt install -y \
  bridge-utils

  cat ./settings/interfaces >> /etc/network/interfaces
  cat ./settings/dhcpcd.conf >> /etc/dhcpcd.conf
}

main