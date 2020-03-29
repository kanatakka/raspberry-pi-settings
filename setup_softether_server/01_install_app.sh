#!/bin/bash

#
#  Create Date: 2020/03/24
#  Update Date: 2020/03/24
#  Shell Detail:
#  ラズパイSoftEther必要アプリインストールシェル
#  本シェルでブリッジ接続の設定情報の書き込みなども行う。
#  二度実行はしてはいけない。（設定ファイル二重で上書きするため
#  ブリッジするIPアドレスは./settings/dhcpcd.confに記載する。
#

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