#!/bin/sh

vers=`svn log |grep ^r |awk '{print $1}'`

#rm ~/tmp/svn -rf
mkdir -p ~/tmp/svn

for v in $vers
do 
  echo $v
  /bin/rm  ~/tmp/svn/$v -rf
  mkdir -p ~/tmp/svn/$v
  ls ~/tmp/svn/$v
  svn up -$v 
  cp * ~/tmp/svn/$v -rf
done


SVN_VER=$(svn up|awk '{field=$NF};END{print field}'|tr -d '。')
echo $SVN_VER
if [ "$SVN_VER" ];
then
  /bin/rm  ~/tmp/svn/$SVN_VER -rf
  mkdir -p ~/tmp/svn/r$SVN_VER
  cp * ~/tmp/svn/r$SVN_VER -rf
fi

cd ~/tmp/svn 
find -name .svn -exec /bin/rm -rf {} \; 1>/dev/null 2>&1
