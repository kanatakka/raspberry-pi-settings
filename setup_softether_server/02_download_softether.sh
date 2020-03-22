#!/bin/bash

readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)

readonly APP_NAME="SoftEther_VPN_Server"
readonly APP_VERSION="v4.34-9744-beta-2020.03.20"
readonly BASE_LINK="https://jp.softether-download.com/files/softether"
readonly FILE_NAME="softether-vpnserver-"${APP_VERSION}"-linux-arm_eabi-32bit.tar.gz"
readonly DOWNLOAD_LINK="${BASE_LINK}/${APP_VERSION}-tree/Linux/${APP_NAME}/32bit_-_ARM_EABI/${FILE_NAME}"

function init() {
  rm -rf vpnserver
}

function deleteTempFile() {
  rm ${FILE_NAME}
}

function main() {
  init
  wget ${DOWNLOAD_LINK}
  tar -xzvf ${FILE_NAME}
  deleteTempFile

  cp ${SCRIPT_DIR}/settings/vpnserver.service /etc/systemd/system/
  chmod 755 /etc/systemd/system/vpnserver.service
  systemctl daemon-reload
  systemctl enable vpnserver.service

  cd vpnserver && make
  cd .. && mv -f vpnserver /usr/local/ && cd /usr/local/vpnserver/ && chmod 600 * && chmod 700 vpncmd && chmod 700 vpnserver

}

main