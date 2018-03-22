if [ -n "${XAUTHORITY+set}" ]
then
#    echo "found XAUTHORITY"
    exec ~/bin/menu-w
else
    echo "did not find XAUTHORITY, run menu-t instead"
    exec ~/bin/menu-t
fi
