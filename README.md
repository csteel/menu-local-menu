# menu-local-menu

scripts and related resources for local workstation menu system

## Requirements

* https://github.com/csteel/menu-local-help cloned to menu subdirectory (~/bin/local-menu/help) after installation of **menu-local-menu**

become root

```shell
sudo su -
```

apt update then install what you need

```
apt update
```

## firefox (for webgui menu)

```shell
apt install firefox
```

#### git

```shell
apt install git
```

#### myrepos

```shell
apt install myrepos
```

#### pandoc

```shell
apt install pandoc
```

## local-menu manual installation

### Ensure '~/bin' is in your path

This is usally done in `~/.profile` or `~/.bashrc` and looks like this in a default Ubuntu 16.04 `~/.profile` desktop system:

```shell
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
```

## Clone repositories

### Clone the menu system

```shell
cd ~/bin
git clone git@github.com:csteel/menu-local-menu.git local-menu
```

### Clone your default help files

```shell
cd local-menu
git clone git@github.com:csteel/menu-local-help.git help
```

### Ensure for (relative) sym links to menu script(s) in ~/bin

```shell
cd ~/bin
ln -sf local-menu/menu.sh menu
ln -sf local-menu/menu-t.sh menu-t
ln -sf local-menu/menu-w.sh menu-w
```

## Testing

### Web menu

By default the web menu is displayed. You can test by running "menu" in a terminal session

```shell
menu
```

This should launch a new firefox instance and display an index of local-help. By default this displays a link to the **about** README.md which is in turn converted to html using js.

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

