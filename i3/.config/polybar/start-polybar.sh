#!/bin/bash

set -eo pipefail

if pgrep -u $UID -x polybar > /dev/null; then
  killall -q -u "${USER}" polybar

  count=0
  while pgrep -u "${UID}" -x polybar > /dev/null; do
    # if polybar has taken more than 5 seconds to shutdown, take more drastic
    # action
    if [ "${count}" -gt 5 ]; then
      killall -q -u "${USER}" -9 polybar
      break
    fi

    count=$count + 1
    sleep 1
  done
fi

echo "Launching polybar..."
polybar -c "${HOME}/.config/polybar/config" primary &
polybar -c "${HOME}/.config/polybar/config" secondary &
