#! /bin/bash

list=$(flatpak list | yad --list --column="Flatpaks" --no-column --button="Modify":0)

if [[ $? -eq 0 ]]; then
fp_info=$(flatpak info $list)

#Run/Terminate logic
modify_fp=$(yad --title="Flatbed: Modify Flatpak" --text="$fp_info"/
--button="Run":'flatpak run $list'/
--button="Remove":'flatpak uninstall $list'
--button="Reset Permissions":'flatpak permission-reset $list') 
fi
