#!/bin/bash

readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ "`whoami`" != "root" ]; then
  echo "Require root privilege"
  exit 1
fi

function main() {
  apt update && apt install -y \
  bridge-utils

  cat ${SCRIPT_DIR}/settings/interfaces >> /etc/network/interfaces
  cat ${SCRIPT_DIR}/settings/dhcpcd.conf >> /etc/dhcpcd.conf
}

main