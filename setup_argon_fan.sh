#!/bin/bash

if [ "`whoami`" != "root" ]; then
  echo "Require root privilege"
  exit 1
fi

curl https://download.argon40.com/argon1.sh | bash

argonone-config