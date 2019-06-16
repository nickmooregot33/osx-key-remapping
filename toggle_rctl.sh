#!/bin/bash

. ~/bin/keymap

# In the json output, src is actually the key being pressed.  
# Destination is the key the system is going to interpret it as


#if it's on, we want it to be off
#if it's off, we want it to be on

if check_for_key_mappings F9:RIGHT_ARROW F8:UP_ARROW F7:DOWN_ARROW F6:LEFT_ARROW RIGHT_ARROW:RIGHT_CONTROL UP_ARROW:RIGHT_CONTROL LEFT_ARROW:RIGHT_CONTROL DOWN_ARROW:RIGHT_CONTROL; then
	COMMAND="$(build_remap_keys_command RIGHT_ARROW:RIGHT_ARROW UP_ARROW:UP_ARROW DOWN_ARROW:DOWN_ARROW LEFT_ARROW:LEFT_ARROW F9:F9 F8:F8 F7:F7 F6:F6)"
elif check_for_key_mappings RIGHT_ARROW:RIGHT_ARROW UP_ARROW:UP_ARROW DOWN_ARROW:DOWN_ARROW LEFT_ARROW:LEFT_ARROW F9:F9 F8:F8 F7:F7 F6:F6; then
	COMMAND=$(build_remap_keys_command F9:RIGHT_ARROW F8:UP_ARROW F7:DOWN_ARROW F6:LEFT_ARROW RIGHT_ARROW:RIGHT_CONTROL UP_ARROW:RIGHT_CONTROL LEFT_ARROW:RIGHT_CONTROL DOWN_ARROW:RIGHT_CONTROL)
elif  hidutil property --get "UserKeyMapping" | grep -q '^(null)$';then
	COMMAND=$(build_remap_keys_command F9:RIGHT_ARROW F8:UP_ARROW F7:DOWN_ARROW F6:LEFT_ARROW RIGHT_ARROW:RIGHT_CONTROL UP_ARROW:RIGHT_CONTROL LEFT_ARROW:RIGHT_CONTROL DOWN_ARROW:RIGHT_CONTROL)
else
	hidutil property --get "UserKeyMapping" 
	echo "not doing anything"	
	:
fi
echo $COMMAND | bash
	


