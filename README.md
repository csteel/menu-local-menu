# menu-local-menu

scripts and related resources for local workstation menu system

## Requirements

* https://github.com/csteel/menu-local-help cloned to menu subdirectory (~/bin/local-menu/help) after installation of **menu-local-menu**

### Users

#### firefox (for webgui menu)

```shell

```

#### git

```shell
apt update
apt install git
```

#### myrepos

```shell
apt update
apt install myrepos
```

#### pandoc

```shell
apt update
apt install pandoc
```

## Installation (manual)

### manual installation

#### Ensure for path

```shell
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
```

## Clone repositories

### Clone menu system

```shell
cd ~/bin
git clone git@github.com:csteel/menu-local-menu.git local-menu
```

### Clone (local) help files

```shell
cd local-menu
git clone git@github.com:csteel/menu-local-help.git help
```

### Ensure for (relative) sym link to menu script(s)

```shell
mkdir ~/bin
cd ~/bin
ln -sf local-menu/menu.sh menu
ln -sf local-menu/menu-t.sh menu-t
ln -sf local-menu/menu-w.sh menu-w
```

## Testing

### Default menu

type "menu" in a terminal

```shell
menu
```

This should launch a new firefox instance and display an index of local-help. By default is displays a link to the **about** README.md that is converted to html.

### Terminal menu

If you do not have an XSESSION running a text based index is display and options will display a text based help file that is a live pandoc conversion of the items README.md file.

To test this you can ssh to the local host and test the **menu** command as follows:

```shell
ssh localhost
menu
```

This should output the text menu.

## LICENSE(S)

See various components for licensing information.

* See the [js/stmd.js](js/stmd.js) for the original license on stmd.js - CommonMark in javascript, Copyright (C) 2014 John MacFarlane, License: BSD3.

