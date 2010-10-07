#!/bin/bash - 
#===============================================================================
#
#          FILE:  svntar.sh
# 
#         USAGE:  ./svntar.sh 
# 
#   DESCRIPTION:  svn modified files to tar
#                 find the files that has modified and not commit to svn .
#                 tar it to a tar file with filename:svn_diff_$date.tar
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Karl Zheng (http://blog.csdn.net/zhengkarl), ZhengKarl@gmail.com
#       COMPANY: Meizu
#       CREATED: 2010年10月07日 14时08分16秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

date_str="$(date +%Y%m%d_%T|tr -d ':')"
tmp_file_name=svn_diff_$date_str".tar" 
svn diff | grep ^Index | awk '{printf $2 " "}END{print " "}'|xargs tar --force-local -rvf $tmp_file_name
echo -e "\nsave the modified files to tar file: "$tmp_file_name
unset tmp_file_namei 
unset date_str
