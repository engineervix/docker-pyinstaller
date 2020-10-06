#!/usr/bin/env bash

### This didn't work as expected. Leaving it here for future reference

# startVirtualFrameBuffer() {
#     # uncomment to force Xvfb
#     # export DISPLAY=:0
#     if [[ $DISPLAY == ":99" ]]; then
#         echo "starting virtual frame buffer as display 99"
#         # Xvfb :0 -screen 0 1024x768x16 &
#         Xvfb :99 &
#     else
#         echo "$DISPLAY != 99, assuming external X running"
#     fi
# }

set -x

### This didn't work as expected. Leaving it here for future reference
# startVirtualFrameBuffer

### This didn't work as expected. Leaving it here for future reference
# xvfb-run -a winetricks win10

winetricks win10

while (( $(ps | grep wineserver | grep -vc grep) != 0 )); do
    echo "waiting for wineserver to terminate..."
    sleep 5
done
