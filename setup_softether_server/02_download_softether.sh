#!/bin/bash

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
}

main