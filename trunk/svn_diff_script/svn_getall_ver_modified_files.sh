#!/bin/bash

ver_index=0

for ver in $(svn log -q |grep '^r'|awk '{print $1}'|cut -c 2-);
do
  all_svn_ver[$ver_index]=$ver
  ((ver_index++))
done

total_ver_number=$ver_index
last_index=$(expr $total_ver_number - 1)

if [ $# -lt 1 ]; then
  echo "You have not point out the lowest svn ver!!"
  echo "System will extract all svn versions!"
  echo 'pls input "y" to comfirm. "n" to cancel:'
  read y
  if [ "x$y" != "xy" ]; then
    exit 1
  fi
  lowest_ver=${all_svn_ver[$last_index]}
  echo "System is extracting all svn versions!"
fi

if [ $# -lt 3 ]; then
  lowest_ver=${all_svn_ver[$last_index]}
  if [ $# -lt 2 ]; then 
    cur_dir=$(pwd)
    cur_sub_dir=$(echo ${cur_dir##*/})
    cut_dir_str="$cur_sub_dir"
  else
    cut_dir_str="$2"
  fi
else 
  cut_dir_str="$2"
  lowest_ver=$3
fi

echo "lowest_ver:" $lowest_ver
echo "cut_dir_str:" $cut_dir_str
echo "all_svn_ver:" $all_svn_ver
echo "total_ver_number:" $total_ver_number

ver_index=0
echo ${all_svn_ver[$ver_index]} 
while [ $ver_index -lt $total_ver_number ]; 
do
  if [ ${all_svn_ver[$ver_index]} -ge $lowest_ver ];then
    if [ ${all_svn_ver[$ver_index]} = $lowest_ver ]; then
      echo ${all_svn_ver[$ver_index]} $cut_dir_str $lowest_ver
      svn_get_ver_modified_files.sh ${all_svn_ver[$ver_index]} $cut_dir_str $lowest
    else
      echo ${all_svn_ver[$ver_index]} $cut_dir_str ${all_svn_ver[$ver_index+1]}
      svn_get_ver_modified_files.sh ${all_svn_ver[$ver_index]} $cut_dir_str ${all_svn_ver[$ver_index+1]}
    fi
    
    if [ $? != 0 ]; then 
      echo "get single ver files error at:"  ${all_svn_ver[$ver_index]}
      echo "system exiting.....!!"
      exit 1
    fi
    ((ver_index++))
  fi
done

