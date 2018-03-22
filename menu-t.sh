#!/bin/bash

# adapted from
#
#    http://tldp.org/LDP/abs/html/testbranch.html#CASECMD
#    Example 11-30. Creating menus using select
#
# license
#
#    GNU Free Documentation License
#
# Requirements:
#
#    items.txt
#
#    A text file called menuitems.txt should be place in the same directory as this file.
#    Place a single menu description on each line.
#
#    For example:
#
#      about
#      contributing
#      some_other_item
#
#    PATH
#
#    The PATH env should include ~/bin. For Ubuntu that would be in ~/.bashrc, for
#    others perhaps ~/.profile
#
# Usage:
#
#    Start a terminal session and enter:
#
#        menu-t
#
MENU_DIR="$HOME/bin/local-menu"
MENU_HELP_DIR="$MENU_DIR/help"
DIR_NAMES_TMP_FILE="directories.txt.tmp"
DIR_NAMES_TMP_PATH=/tmp/$DIR_NAMES_TMP_FILE
listdirs(){ set -- */; printf "%s\n" "${@%/}"; }
cd $MENU_HELP_DIR
listdirs > "$DIR_NAMES_TMP_PATH"
##
clear
PS3='Select the number and then press return: ' # Sets the prompt string.
                                       # Otherwise it defaults to #? .
MENUITEMS=""
while IFS=$'
' read -r line || [[ -n "$line" ]]; do
   MENUITEMS="$MENUITEMS $line"
done < $DIR_NAMES_TMP_PATH
echo

select menuitem in $MENUITEMS
do
  clear
  pandoc -f markdown -t plain --wrap=none $MENU_HELP_DIR/${menuitem}/README.md -o $MENU_HELP_DIR/${menuitem}/README.txt.tmp
  cat "$MENU_HELP_DIR/${menuitem}/README.txt.tmp"
  rm "$MENU_HELP_DIR/${menuitem}/README.txt.tmp"
  break  # What happens if there is no 'break' here?
done
exit

