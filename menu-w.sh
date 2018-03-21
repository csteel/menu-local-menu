#!/bin/bash
#
# vars
#
MENU_DIRS_LIST_PATH=/tmp/directories.txt.tmp
MENU_INDEX_README_PATH="$HOME/bin/menu/help/index/README.md"
listdirs(){ set -- */; printf "%s\n" "${@%/}"; }
cd "$HOME/bin/menu/help/"
listdirs > $MENU_DIRS_LIST_PATH
#
echo "# ACE Resources" > "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
echo "## Local Resources" >> "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
#
MENUITEMS=""
while IFS=$'
' read -r line || [[ -n "$line" ]]; do
#   MENUITEMS="$MENUITEM * [$line]($line/$line.md)\n"
   echo "* [$line](../$line/index.html)" >> "$MENU_INDEX_README_PATH"
#   echo $MENUITEMS
done < "$MENU_DIRS_LIST_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
echo "## Additional Resources" >> "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
echo "* [ACElab.ca](https://acelab.ca/)" >> "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
cd $HOME/bin/menu
firefox --new-window $HOME/bin/menu/help/index/index.html &&
exit
