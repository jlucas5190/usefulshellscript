#!/bin/bash - 
#===============================================================================
#
#          FILE:  sgmf.sh
# 
#         USAGE:  ./sgmf.sh 
# 
#   DESCRIPTION:  sgmf = svn get modified files
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Karl Zheng (http://blog.csdn.net/zhengkarl), ZhengKarl#gmail.com
#       COMPANY: Meizu
#       CREATED: 2010年09月26日 10时15分37秒 CST
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

#svn_get_ver_modified_files "$src_dir" $highest_ver $lowest_ver "$dest_dir" "$cut_dir_string" 
function svn_get_ver_modified_files()
{
  echo "$1" "$2" "$3" "$4" "$5"

  local SAVE_DIR="$4/$5/r_$2_$3"
  if [ -d $SAVE_DIR ];then
    echo "This version diff files has been saved!!"
    return 1
  fi
  if [ $2 != $3 ]; then
    local low_compare_ver=$(expr $3 + 1)
  else
    local low_compare_ver=$3;
  fi

  mkdir -p "$SAVE_DIR"
  cd $1
  svn log -r$2 > "$SAVE_DIR/svn_log_r$2.txt"

  for file in $(svn log -r$low_compare_ver:$2 -q -v "$1" | sed -n "/^\s*M\|^\s*A\|^\s*U/s#.*$5/##p");
  do
    local dir=$(dirname "$file")
    local whole_dir="$SAVE_DIR/$dir"
    mkdir -p "$whole_dir"
    if [ ! -d "$file" ]; then
      echo "$whole_dir/$(basename \"$file\")"
      echo  "$whole_dir/$(basename \"$file\")"  
      local filename=$(basename "$file")  
      svn cat -r$2 "$file" > "$whole_dir/$filename"  2> /dev/null
    fi
  done
  n=0
  for file in $(svn log -r$low_compare_ver:$2 -q -v | sed -n "/^\s*M/s#.*$5/##p");
  do
    local modified_file_arr[$n]="$file"
    ((n++))
  done

  local DIFF_DIR="$SAVE_DIR""_ori"

  [ -d $DIFF_DIR ] && /bin/rm $DIFF_DIR -rf
  mkdir -p $DIFF_DIR

  for file in ${modified_file_arr[*]};
  do
    local dir=$(dirname "$file")
    local whole_dir="$DIFF_DIR/$dir"
    [ -e $whole_dir ] || mkdir -p $whole_dir
    if [ ! -d $file ] && [ -e $file ]; then
      #cp $file $whole_dir 
      echo $whole_dir$file
      #svn cat -r$3 "$file" > "$whole_dir/$(basename \"$file\")" 2>/dev/null
      local filename=$(basename "$file")  
      svn cat -r$3 "$file" > "$whole_dir/$(filename)" 2>/dev/null
    fi
  done
}

# svn_get_all_ver_modified_files "$src_dir" $highest_ver $lowest_ver "$dest_dir" "$cut_dir_string" 
function svn_get_all_ver_modified_files()
{
  if [ $2 = $3 ];then
    svn_get_ver_modified_files "$1" "$2" "$3" "$4" "$5"
  else
    local ver_cnt=${#all_svn_ver[@]};
    local ver_index=1;
    local highest_ver=$2;
    local lowest_ver=$3;

    if [ $ver_cnt -lt 2 ];then
      return;
    fi

    while [ $ver_index -lt $ver_cnt ]; 
    do
      local v=${all_svn_ver[$ver_index]}
      if [ $v -ge $lowest_ver -a $v -lt $highest_ver ];then
        local v_next=${all_svn_ver[$ver_index+1]}
        svn_get_ver_modified_files "$1" $v_next $v "$4" "$5"
      fi
      if [ $v -gt $highest_ver ];then 
        break;
      fi
      ((ver_index++))
    done
  fi

  return 0
}
 
while [ $# -gt 0 ];
do
  case $1 in
    -o | -only)
    only_one_ver=1
    ;;
    -l |-low |-lower |-lowest)
    shift
    lowest_ver="$1"
    ;;
    -h | -high | -higher |-highest)
    shift
    highest_ver="$1"
    ;;
    -cds | -cut_dir_string)
    shift
    cut_dir_string="$1"
    ;;
    -d | -dest)
    shift
    dest_dir="$1"
    ;;
    -s | -src_dir)
    shift
    src_dir="$1"
    ;;
    *)
    echo "unknow parameter; exit!!"
    exit 1;
    ;;
  esac
  shift
done

if [ -z "$src_dir" ]; then
  src_dir="$(pwd)"
fi

if [ -z "$highest_ver" -o -z "$lowest_ver" ];then
  ver_index=0
  for ver in $(svn log -q "$src_dir"|grep '^r'|tac|awk '{print $1}'|cut -c 2-);
  do
    all_svn_ver[$ver_index]=$ver
    ((ver_index++))
  done
  [ -z "$lowest_ver" ] && lowest_ver=${all_svn_ver[0]}
  [ -z "$highest_ver" ] && highest_ver=${all_svn_ver[$(expr $ver_index - 1)]}
fi

if [ -z "$dest_dir" ];then
  dest_dir="$(pwd)/../diff_vers/"
fi

if [ -z "$cut_dir_string" ];then
  cut_dir_string=$(basename "$src_dir")
fi

echo "$src_dir" "$highest_ver" "$lowest_ver" "$dest_dir" "$cut_dir_string" "$only_one_ver"

if [ -z "$only_one_ver" ]; then
  svn_get_all_ver_modified_files "$src_dir" $highest_ver $lowest_ver "$dest_dir" "$cut_dir_string" 
else
  svn_get_ver_modified_files "$src_dir" $highest_ver $lowest_ver "$dest_dir" "$cut_dir_string" 
fi

