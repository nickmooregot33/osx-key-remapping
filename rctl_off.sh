#!/bin/bash

. ~/bin/keymap

COMMAND=$(build_remap_keys_command RIGHT_ARROW:RIGHT_ARROW UP_ARROW:UP_ARROW DOWN_ARROW:DOWN_ARROW LEFT_ARROW:LEFT_ARROW F9:F9 F8:F8 F7:F7 F6:F6)
echo $COMMAND | bash
