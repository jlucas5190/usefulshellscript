#!/bin/sh

if [ $# -lt 2 ]; then
  echo "need two parameters for:1.svn ver; 2.strip string"
  exit 1
fi

if [ -d r$1 ];then
  exit 1
fi

#[ -d r$1 ] && /bin/rm r$1 -rf
mkdir -p r$1

#svn up -r$1

if [ $# = 3 ]; then
  for file in $(svn log -r$1:$3 -q -v | sed -n "/^\s*M\|^\s*A\|^\s*U/s#.*$2/##p");
  do
    echo $file
    dir=$(dirname $file)
    whole_dir=r$1/$dir
    mkdir -p $whole_dir
    if [ ! -d $file ]; then
      #cp $file $whole_dir 
      svn cat -r$1 $file > $whole_dir/$(basename $file)
    fi
  done
  n=0
  for file in $(svn log -r$1:$3 -q -v | sed -n "/^\s*M/s#.*$2/##p");
  do
    modified_file_arr[$n]=$file
    ((n++))
  done
else
  for file in $(svn log -r$1 -q -v | sed -n "/^\s*M\|^\s*A\|^\s*U/s#.*$2/##p");
  do
    echo $file
    dir=$(dirname $file)
    whole_dir=r$1/$dir
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

DIFF_DIR=r$1"_"$last_ver

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

