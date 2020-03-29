#!/bin/bash

#
#  Create Date: 2020/03/24
#  Update Date: 2020/03/24
#  Shell Name: アプリ定期アップデートシェル
#  Shell Detail:
#  定期的にアプリをアップデートする
#
#  Usage:
#  /etc/crontabに以下を記載する
#  30 * * * * root bash /root/auto_apt_update.sh
#

readonly SCRIPT_DIR=$(cd $(dirname $0); pwd)

function main() {
  apt update && apt upgrade -y
  ddclient -daemon=0 -verbose
}

main