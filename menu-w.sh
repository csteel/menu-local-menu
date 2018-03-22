#!/bin/bash
#
# vars
#
MENU_DIR="$HOME/bin/local-menu"
MENU_DIRS_LIST_PATH=/tmp/directories.txt.tmp
MENU_INDEX_README_PATH="$MENU_DIR/index/README.md"
#
# list directories
#
listdirs(){ set -- */; printf "%s\n" "${@%/}"; }
cd "$MENU_DIR/help/"
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
   echo "* [$line](../help/$line/index.html)" >> "$MENU_INDEX_README_PATH"
done < "$MENU_DIRS_LIST_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
echo "## Additional Resources" >> "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
echo "* [ACElab.ca](https://acelab.ca/)" >> "$MENU_INDEX_README_PATH"
# images not supported?
#echo " " >> "$MENU_INDEX_README_PATH"
#echo "![logo-mcin-cnim-250x52.png](imgs/logo-mcin-cnim-250x52.png)" >> "$MENU_INDEX_README_PATH"
echo " " >> "$MENU_INDEX_README_PATH"
cd $MENU_DIR
firefox --new-window $MENU_DIR/index/index.html &&
exit
