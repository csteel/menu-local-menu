#!/bin/bash
#
# vars
#
MENU_DIRS_LIST_PATH=/tmp/directories.txt.tmp
MENU_INDEX_README_PATH="$HOME/bin/menu/index/README.md"
#
# list directories
#
listdirs(){ set -- */; printf "%s\n" "${@%/}"; }
cd "$HOME/bin/menu/help/"
listdirs > $MENU_DIRS_LIST_PATH
#
# Create index README header
#
echo "# ACE Resources" > "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
echo "## Local Resource Index" >> "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
#
# Generate indexs list of help dir README.md files
#
MENUITEMS=""
while IFS=$'
' read -r line || [[ -n "$line" ]]; do
#   MENUITEMS="$MENUITEM * [$line]($line/$line.md)\n"
   echo "* [$line](../help/$line/index.html)" >> "$MENU_INDEX_README_PATH"
#   echo $MENUITEMS
done < "$MENU_DIRS_LIST_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
echo "## Additional Resources" >> "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
echo "* [ACElab.ca](https://acelab.ca/)" >> "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
cd $HOME/bin/menu
firefox --new-window $HOME/bin/menu/index/index.html &&
exit
