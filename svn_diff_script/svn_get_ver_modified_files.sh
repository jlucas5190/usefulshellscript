#!/bin/sh

if [ $# -lt 2 ]; then
  echo "need two parameters for:1.svn ver; 2.strip string"
  exit 1
fi

if [ $# = 3 ]; then
ori_ver=$3
else
ori_ver=$(expr $1 - 1)
fi  
SAVE_DIR="../diff_vers/"$2"/r$1_$ori_ver"

if [ -d $SAVE_DIR ];then
  exit 1
fi

#[ -d r$1 ] && /bin/rm r$1 -rf
mkdir -p $SAVE_DIR

svn log -r$1 > $SAVE_DIR/svn_log_r$1.txt

if [ $# = 3 ]; then
  for file in $(svn log -r$3:$1 -q -v | sed -n "/^\s*M\|^\s*A\|^\s*U/s#.*$2/##p");
  do
    echo $file
    dir=$(dirname $file)
    whole_dir=$SAVE_DIR/$dir
    mkdir -p $whole_dir
    if [ ! -d $file ]; then
      #cp $file $whole_dir 
      svn cat -r$1 $file > $whole_dir/$(basename $file)
    fi
  done
  n=0
  for file in $(svn log -r$3:$1 -q -v | sed -n "/^\s*M/s#.*$2/##p");
  do
    modified_file_arr[$n]=$file
    ((n++))
  done
else
  for file in $(svn log -r$1 -q -v | sed -n "/^\s*M\|^\s*A\|^\s*U/s#.*$2/##p");
  do
    echo $file
    dir=$(dirname $file)
    whole_dir=$SAVE_DIR/$dir
    mkdir -p $whole_dir
    if [ ! -d $file ]; then
      #cp $file $whole_dir 
      svn cat -r$1 $file > $whole_dir/$(basename $file)
    fi
  done
  n=0
  for file in $(svn log -r$1 -q -v | sed -n "/^\s*M/s#.*$2/##p");
  do
    modified_file_arr[$n]=$file
    ((n++))
  done
fi

if [ x"$3" != x ];then
  let last_ver=$3
else
  let last_ver=$1-1
fi

#svn up -r$last_ver

DIFF_DIR=$SAVE_DIR"_ori"

[ -d $DIFF_DIR ] && /bin/rm $DIFF_DIR -rf
mkdir -p $DIFF_DIR

for file in ${modified_file_arr[*]};
do
  dir=$(dirname $file)
  whole_dir=$DIFF_DIR/$dir
  [ -e $whole_dir ] || mkdir -p $whole_dir
  if [ ! -d $file ] && [ -e $file ]; then
    #cp $file $whole_dir 
    svn cat -r$last_ver $file > $whole_dir/$(basename $file)
  fi
done

