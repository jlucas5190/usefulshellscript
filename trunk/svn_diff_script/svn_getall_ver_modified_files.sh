#!/bin/sh

if [ $# != 1 ]; then
  echo "must point out the lowest svn ver"
  exit 1
fi

cur_dir=$(pwd)
cur_sub_dir=$(echo ${cur_dir##*/})

vers=`svn log |grep ^r |awk '{print $1}'|tr -d 'r'|sort -r`

for v in $vers
do 
  echo $v
  if [ $v -ge $1 ]; then
    echo $v
    svn_get_ver_modified_files.sh $v $cur_sub_dir
  fi
done

svn up

#rm ~/tmp/svn -rf
#mkdir -p ~/tmp/svn

#  modified_files=$(svn log -$v -q -v |grep -E "^\s*M|^\s*A"|awk '{print $2}') 
#
#  echo "$modified_files" > /tmp/files.txt
#  while read line
#  do
#    echo $line
#  done < /tmp/files.txt

#  modified_files=$(cat /tmp/files.txt)
#  echo ${#modified_files[@]}
#  local i
#  for ((i = 0; i < ${#modified_files[@]}; i++))
#  do
#    echo ${modified_files[$i]}
#    echo "change"
#    modified_files[$i]=${modified_files[$i]#$1}
#    echo "changed"
#    echo ${modified_files[$i]}
#  done

#  modified_files=$(svn log -$v -q -v)
#  echo $modified_files
#  echo $modified_files

#  for f in $modified_files
#  for ((i = 0; i < ${#a[@]}; i++))

#SVN_VER=$(svn up|awk '{field=$NF};END{print field}'|tr -d '。')
#echo $SVN_VER
#if [ "$SVN_VER" ];
#then
#  /bin/rm  ~/tmp/svn/$SVN_VER -rf
#  mkdir -p ~/tmp/svn/r$SVN_VER
#  cp * ~/tmp/svn/r$SVN_VER -rf
#fi
#
#cd ~/tmp/svn 
#find -name .svn -exec /bin/rm -rf {} \; 1>/dev/null 2>&1
