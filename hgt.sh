#sudo apt-get install vim
#sudo apt-get install ctags
#http://swaywang.blogspot.com/2011/10/vim-ctags.html
# $ ctags -R u-boot/*
# :set tags=/home/sway/src/tags
# Ctrl + ]
# Ctrl + t

#path_root="/home/vm/Project/MTP_303_DV_M17/BUILD_ROOT/"
#ctagspath="/home/vm/Project/MTP_303_DV_M17/tags"
path_root="$(pwd)"
#export ctagspath=/home/vm/Project/MTP_303_DV_M17/tags
#> export ctagspath=../tags
size_x=1000
size_y=300

if [ $# == 0 ] ; then
  echo ""
  echo "FORMAT : ./hgt.sh <keyword> [grep arg words] [\"-name '*.c' -o -name '*.h' ...\"]"  
  echo ""       
  exit
fi

#hgt.sh "=full=" "grep -nR \"usb_init\" | grep fpga"
if [ "$1" == "=full=" ] ; then
  treeview "$2" $size_x $size_y "$2" "\"$ctagspath\"" &
  exit 1
fi

if [ $# == 3 ] ; then
  treeview "$1" $size_x $size_y "find \"$path_root\" $3 | xargs grep -nr$2 \"$1\"" "\"$ctagspath\"" &
else
  # \ only escape from hand.
  treeview "$1" $size_x $size_y "grep -nr$2 \"$1\" \"$path_root\"" "\"$ctagspath\"" &
fi

