#!/bin/bash
#===============================================================================
#
#          FILE:  mybashrc.sh
# 
#         USAGE:  put it to your home directory
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Karl Zheng (), ZhengKarl#gmail.com
#          BLOG: http://blog.csdn.net/zhengkarl
#         WEIBO: http://weibo.com/zhengkarl
#       COMPANY: Meizu
#       CREATED: 2012年05月21日 19时12分43秒 CST
#      REVISION:  ---
#===============================================================================

if [ "$SHELL" != "/bin/bash" ];then 
	echo "the SHELL is not bash! exit!!"
fi

unset MAILCHECK

# . /etc/bash_completion
shopt -s histappend
shopt -s histreedit
shopt -s histverify
shopt -s lithist

set expand-tild on

stty -ixon

export MYUSERNAME=$(whoami)
export HISTCONTROL="erasedups:ignoreboth"
export JAVA_HOME=/usr/lib/jvm/java-6-sun/ 
export ANDROID_JAVA_HOME=$JAVA_HOME
export imgout=out/target/product/
export PATH=~/software/bin:${PATH}:/bin/:/usr/local/arm/arm-2010q1/bin/:~/mytools/:/media/cdriver/work/software/android-sdk-linux_86/platform-tools:/media/cdriver/work/source/android-ndk-r5:/media/cdriver/work/software/android-sdk-linux_86/tools:
export EDITOR=vim
export SVN_EDITOR=/usr/bin/vim 
export desktop=~/桌面/
export d=~/桌面/
export PS4='+[$LINENO]'
export dl=~/下载/
export LANG="zh_CN.UTF-8"
export CROSS_COMPILE=arm-none-linux-gnueabi-
export ARCH=arm
export ANDROID_SRC_ROOT=/media/cdriver/work/hal/trunk/
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
#PROMPT_COMMAND="history -a;history -n;$PROMPT_COMMAND"
#命令文件最大行数
export HISTSIZE=50000      
#最大命令历史记录数
export HISTFILESIZE=50000  
#export LANG="en.UTF-8"

#http://huangyun.wikispaces.com/%E7%BB%99man+pages%E5%8A%A0%E4%B8%8A%E5%BD%A9%E8%89%B2%E6%98%BE%E7%A4%BA
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;33m'

#add other info here just for android
#export JAVA_HOME=/usr/lib/jvm/java-1.5.0-sun
#export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/ 
#export ANDROID_PRODUCT_OUT=out/target/product/
#export ANDROID_SWT=/home/${MYUSERNAME}/svn/app_group_android/Eclair/out/host/linux-x86/framework
#export ANDROID_SWT=/media/cdriver/work/software/android-sdk-linux_86/tools/lib/x86/
#export PATH=~/software/bin:${PATH}:~/svn/android_eclair_smdk/out/host/linux-x86/bin/:~/mytools/:~/mytools/depot_tools/:/home/karlzheng/software/android-sdk-linux_86/tools:/media/cdriver/work/source/android-ndk-r5:
#export PATH=~/software/bin:${PATH}:~/svn/android_eclair_smdk/out/host/linux-x86/bin/:/usr/local/arm/arm-2010q1/bin/:/usr/local/arm/4.3.1-eabi-armv6/usr/bin:~/mytools/:~/mytools/depot_tools/:/media/cdriver/work/software/android-sdk-linux_86/tools:/media/cdriver/work/source/android-ndk-r5:
#export PATH=~/software/bin/bin:${PATH}:
#export VIM=/usr/share/vim

# for android compiling
#export TARGET_BUILD_TYPE=debug
#export skernel=/root/version_control/samsung/android_kernel_smdkc100_RTM20_camera_isp3/android_kernel_smdkc100_RTM20
#export eclair=/root/source/android2.0/eclair
#export ekernel=/root/version_control/samsung/kernel_6410_Eclair 

bind -m emacs '"\en": history-search-forward'
bind -m emacs '"\ep": history-search-backward'
bind -m emacs '"\ew": backward-kill-word'

bind -m emacs '"\C-o": menu-complete'

bind -m emacs '"\C-gc": "grep \"\" * --color -rHnIf"'
bind -m emacs '"\C-gm": "grep mei Makefile"'
bind -m emacs '"\C-gz": " arch/arm/boot/zImage"'

bind -m emacs '"\C-g\C-a": "grep \"\" * --color -rHniI|grep -v ^tags|grep -v ^cscopef"'
bind -m emacs '"\C-g\C-b": "grep \"\" * --color -rHnIC2f"'
bind -m emacs '"\C-g\C-f": "bcompare $(f) . &"'
bind -m emacs '"\C-g\C-n": "find -name "'

unalias ls
alias adb_="sudo adb kill-server && sudo adb start-server"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias CD='cd'
alias cd.='cd ../..'
alias cd..='cd ../../..'
alias cdg='cd /media/work/kernel/meizu/git/mx/linux-2.6.35-mx-rtm'
alias ck="cd /media/cdriver/work/kernel/meizu/"
alias copy_to_m8="rsync -av /media/x/english/voa/ /media/Meizu\ M8/Music/voa/"
alias cp='cp -i '
alias cw="cd /media/work/"
alias diff='diff -x .svn'
alias gitdiff="git diff --no-ext-diff -w |vim -R -"
alias grep='grep --exclude-dir=.svn --exclude="*.o" --exclude="*.o.cmd" '
alias h='history|tail -n 30'
alias ht='history |tail -n 10 '
alias LA='ls -A'
alias la='ls -latr'
alias ll='ls -l '
alias l='ls -CF '
alias lm='ls arch/arm/configs/meizu*'
alias lr='ls -latr'
alias LS='ls'
alias ls='ls --color=tty -a '
alias lS='ls -laSr '
alias lsr='ls -lasr '
alias lsr='ls -lasr '
alias lt='ls -lat '
alias ltr='ls -latr '
alias mcd='cd '
alias mj='make -j8 '
#alias mt3='mount -t ext3 '
#alias mtnfs=' mount -t nfs '
#alias mto='mount -o loop '
alias mv='mv -i '
alias mz='make zImage -j16 '
alias MZ='mz'
alias po='popd'
alias pp="cat -n /dev/shm/${MYUSERNAME}path"
alias pu1='pushd +1'
alias pu='pushd .'
alias rsync241="rsync cefanty@172.16.10.241:/home/cefanty/svn/kernel/linux-2.6.35-meizu/arch/arm/boot/zImage ~/img/241/zImage"
alias sb='source ~/mybashrc.sh'
alias slog='svn log |tac '
alias smbmount242_home='sudo smbmount //172.16.10.242/home/ /media/242/ -o iocharset=utf8,username=${MYUSERNAME},dir_mode=0777,file_mode=0777'
alias smbmount242='mount |grep -q 242; if [ $? = 0 ];then sudo umount /media/x;fi;sudo smbmount //172.16.10.242/home/svn /media/x/ -o iocharset=utf8,dir_mode=0777,file_mode=0777,username=${MYUSERNAME}'
alias smbmount99_common='sudo smbmount //172.16.10.99/开发部公共文件夹/ /media/mzf_common/ -o iocharset=utf8,username=zhengkl,password=zheng09,dir_mode=0777,file_mode=0777'
alias smbmount99='sudo umount /media/mzf/;sudo smbmount //172.16.10.99/开发部/ /media/mzf/ -o iocharset=utf8,username=zhengkl,password=zheng09,dir_mode=0777,file_mode=0777'
alias s='ssh zkl@172.16.10.242 '
alias ss='ssh zhengkangliang@172.16.2.103'
alias sss='ssh cefanty@172.16.10.241 '
alias svnaw="svn diff | grep ^Index | awk '{printf \$2 \" \"}END{print \" \"}'"
alias svnaw_touch="svn diff | grep ^Index | awk '{printf \$2 \" \"}END{print \" \"}' |xargs touch"
alias ksvn="kdesvn"
alias vb='vi ~/mybashrc.sh'
alias VI='vi'

#alias mydate="echo $(date +%Y%m%d_%T)"
#alias svnawtar="date_str=$(date +%Y%m%d_%T) && tmp_file_name=svn_diff_$date_str && svnaw |xargs \
#tar --force-local -rvf \$tmp_file_name.tar && echo \$tmp_file_name && unset \
#tmp_file_namei && unset date_str"
#tac ~/.bash_history |awk '!a[$0]++' |tac > /tmp/.bash_history &&  mv /tmp/.bash_history ~/.bash_history -f
#alias pwd='builtin pwd; builtin pwd >> /dev/shm/${MYUSERNAME}path;'
#alias sdnw='sudo dnw '

function ac()
{
	[ -f /dev/shm/${MYUSERNAME}/apwdpath ] && tmp_dir="$(cat /dev/shm/${MYUSERNAME}/apwdpath)" && builtin cd "$tmp_dir" && unset "tmp_dir"
}

#alias apwd='builtin pwd >> /dev/shm/${MYUSERNAME}path'
function ap()
{
	builtin pwd;
	[ -d /dev/shm/${MYUSERNAME} ] || mkdir -p /dev/shm/${MYUSERNAME}
	builtin pwd > /dev/shm/${MYUSERNAME}/apwdpath;
}

function apwd_abc()
{
	builtin pwd;
	local p=$(builtin pwd);
	grep -q "^$p$"  /dev/shm/${MYUSERNAME}path
	if [ $? != 0 ]; then
		builtin pwd >> /dev/shm/${MYUSERNAME}path;
	fi  
	wc -l /dev/shm/${MYUSERNAME}path |awk '{print $1}' > /dev/shm/total_count
}

function atar() 
{
	#http://www.ibm.com/developerworks/cn/aix/library/au-spunixpower.html?ca=drs-#history
	  if [ -f $1 ] ; then
		case $1 in
		  *.tar.bz2)   tar xjf $1     ;;
		  *.tar.gz)    tar xzf $1     ;;
		  *.bz2)       bunzip2 $1     ;;
		  *.rar)       rar x $1       ;;  
		  *.gz)        gunzip $1      ;;  
		  *.tar)       tar xf $1      ;;  
		  *.tbz2)      tar xjf $1     ;;  
		  *.tgz)       tar xzf $1     ;;  
		  *.zip)       unzip $1       ;;  
		  *.Z)         uncompress $1  ;;  
		  *.7z)        7z x $1        ;;  
		  *)           echo "'$1' cannot be extracted via extract()" ;;
		esac
	  else
		echo "'$1' is not a valid file"
	  fi  
}

function append_daily_path()
{
	local path_list=(
		#'/media/work/4212/meizu/linux-3.0.15-beta'
		#'/home/${MYUSERNAME}/svn/compiled/uboot-1.3.4-m9'
		'/home/karlzheng/to_del1/uboot-mxse'
		'/media/cdriver/work/kernel/meizu/m032/linux-3.0.15-rtm-dev'
	);
	[ -f /dev/shm/${MYUSERNAME}path ] || touch /dev/shm/${MYUSERNAME}path
	for p in ${path_list[@]}; do
		grep -q "^$p$"  /dev/shm/${MYUSERNAME}path
		if [ $? != 0 ]; then
			echo "$p" >> /dev/shm/${MYUSERNAME}path;
		fi
	done
	wc -l /dev/shm/${MYUSERNAME}path |awk '{print $1}' > /dev/shm/total_count
}

function c()
{
	if [ ! -f /dev/shm/cur_pos ]; 
	then echo "1" > /dev/shm/cur_pos;  
		local  cur_pos=1;
	else local cur_pos=$(cat /dev/shm/cur_pos);
		local total_count=$(cat /dev/shm/total_count);
		((cur_pos ++));
		if [ $cur_pos -gt $total_count ]; 
		then cur_pos=$(expr $cur_pos - $total_count);
		fi
		echo $cur_pos > /dev/shm/cur_pos;  
	fi
	local enter_dir=$(sed -n "$cur_pos{p;q;}"  /dev/shm/${MYUSERNAME}path)
	builtin cd "$enter_dir"
	ap
}

function ca()
{
	if [ ! -f /dev/shm/pwd_pos ]; then
		echo "1" > /dev/shm/pwd_pos;  
		local  pwd_pos=1;
	else local pwd_pos=$(cat /dev/shm/pwd_pos);
		#if [ ! -f /dev/shm/pwd_total_count ];then
			wc -l ~/pwd.txt |awk '{print $1}' > /dev/shm/pwd_total_count
		#fi
		local total_count=$(cat /dev/shm/pwd_total_count);
		((pwd_pos ++));
		if [ $pwd_pos -gt $total_count ]; 
		then pwd_pos=$(expr $pwd_pos - $total_count);
		fi
		echo $pwd_pos > /dev/shm/pwd_pos;  
	fi
	local enter_dir=$(sed -n "$pwd_pos{p;q;}"  ~/pwd.txt)
	builtin cd "$enter_dir"
}

function pa()
{
	grep -q "^$(pwd)$" ~/pwd.txt
	if [ $? != 0 ]; then
		pwd >> ~/pwd.txt
	fi
}


function cdb() {
	if [ $# -eq 0 ];then
		echo arch/arm/boot/
		cd arch/arm/boot/
	fi  
}

function cdc() {
	if [ $# -eq 0 ];then
		cd arch/arm/configs
	else 
		cd $1
	fi  
}


function cv()
{
    if [ ! -f /dev/shm/vim_cur_file_path ]; 
        then echo "no /dev/shm/vim_cur_file_path file";  
    else 
        local enter_dir="$(cat /dev/shm/vim_cur_file_path)";
        builtin cd "$enter_dir"
    fi
}

function cleantrash()
{ 
	/bin/rm -rf ~/.trash;
	mkdir ~/.trash;
	sync;
}

function lrm()
{ 
	ls ~/.trash/ ;
}

function rm () 
{ 
   if [ ! -d ~/.trash ]; then
      mkdir ~/.trash;
   fi;
   #mv -i $* ~/.trash
   /bin/mv $* ~/.trash
}

function undel()
{
	mv ~/.trash/$* . ;
}

function f()
{
    if [ -f /dev/shm/filename ]; 
        then cat /dev/shm/filename 
    fi
}

function fa()
{
	pwd > /dev/shm/filename 
}

function gitsvnco()
{
	if [ $# == 0 ]; then
		echo "Must deposit which svn dir you want to check out!!"
		exit 1;
	fi
	git svn init "$1" --no-metadata
	git svn fetch
}

function gitsvnup()
{
	git svn fetch
	git rebase --onto git-svn --root
}

function gittar()
{
	# http://blog.csdn.net/free2o/archive/2009/03/11/3981786.aspx
    local name=$(pwd)
    name=${name##*/}

    if [ ! "$1" ]; then
        echo "[ERROR] what branch to export?"
        return 1
    fi

    local date=$(TZ=UTC date '+%Y%m%d.%H%M')
    local pkg="$name-$date"
    local dir=".."
    local tar="$dir/$pkg.tar.gz"

    git archive \
        --format=tar \
        --prefix="$pkg/" \
        "$@" |
    gzip --best > "$tar"

    echo $tar
}

function ha()
{
    local ignore_cmd_list=(c h history ha hd he ls la)
    n=0
    history 10 |sort -r > /dev/shm/hist10.txt
    while read line;
    do  
        local cmd_line=$(echo "$line" |sed -e "s/[0-9]*  \(.*\)/\1/")
        local is_ignore_cmd=0
        for cmd in ${ignore_cmd_list[@]};
        do
            if [ x"$cmd_line" == x"$cmd" ]; then
                is_ignore_cmd=1
            fi
        done
        if [ $is_ignore_cmd == 0 ];then
            echo "$cmd_line" > /dev/shm/hist_cmd.txt 
            echo "$cmd_line" 
            return 0
        fi
    done  < /dev/shm/hist10.txt
}

function hd()
{
    cat  /dev/shm/hist_cmd.txt 
}

function he()
{
    local cmd_line=$(tail -1 /dev/shm/hist_cmd.txt|tr -d "\r"|tr -d "\n")
    echo "$cmd_line"
    history -s "$cmd_line"
    #exec "$cmd_line"
    eval "$cmd_line"
}

function lac() {
     if [ $# -eq 0 ];then
		 echo "arch/arm/configs"
		 ls arch/arm/configs
     else 
       ls $1
     fi  
     return 0
}

function mkdircd () 
{ 
  mkdir -p "$@" && eval cd "\"\$$#\""; 
}

function mkmm() {
     if [ $# -eq 0 ];then
       make menuconfig
     else 
       make $1
     fi
     return 0
}

function mypath()
{
	local i=0
	while read line
	do
		echo $line
		eval "p$i=$line"
		#echo "${m[$i]}"
		((i++))
	done < /dev/shm/${MYUSERNAME}path
}

function myvimpath()
{
    export PATH=~/software/bin/bin:${PATH}:
}

function n()
{
	if [ $# -eq 0 ];then
		nautilus .
	else 
		nautilus $1
	fi  
	return 0
}

function sdnw() {
  if [ $# -ge 1 ];then
    local filename="$(echo ${1/11111/})"
    #sudo dnw $1
    dnw "$filename"
  fi
  return 0
}

function sdu () {
	#http://lilydjwg.is-programmer.com/posts/18368.html
	du -sk $@ | sort -n | awk '
	BEGIN {
		split("K,M,G,T", Units, ",");
		FS="\t";
		OFS="\t";
	}
	{
		u = 1;
		while ($1 >= 1024) {
			$1 = $1 / 1024;
			u += 1
		}
		$1 = sprintf("%.1f%s", $1, Units[u]);
		sub(/\.0/, "", $1);
		print $0;
	}'
}

function swap()
{
  mv $1 tmp.$$
  mv $2 $1
  mv tmp.$$ $2
}

#alias mcd='pu; ${MYUSERNAME}path=$(tail -n 1 /dev/shm/${MYUSERNAME}path); cd $${MYUSERNAME}path'
function _mcd_complete() {
     COMPREPLY=()
     local cur=${COMP_WORDS[COMP_CWORD]};
     local com=${COMP_WORDS[COMP_CWORD-1]};
     case $com in
     'mcd')
         local my_complete_word=($(cat /dev/shm/${MYUSERNAME}path))
         COMPREPLY=($(compgen -W '${my_complete_word[@]}' -- $cur))
         ;;
     'c')
         local my_complete_word=($(cat /dev/shm/${MYUSERNAME}path))
         COMPREPLY=($(compgen -W '${my_complete_word[@]}' -- $cur))
         ;;
     *)
         ;;
     esac
     return 0
}

function _dnw_complete() {
     COMPREPLY=()
     local cur=${COMP_WORDS[COMP_CWORD]};
     local com=${COMP_WORDS[COMP_CWORD-1]};
     case $com in
     'dnw')
         local my_complete_word=("/media/x/compiled/uboot-1.3.4-m9/u-boot-fuse.bin"
                           "/media/x/compiled/uboot-1.3.4-m9_v4/u-boot-fuse.bin"
                           "/media/x/compiled/meizu_m9_master/linux-2.6.29-meizu/arch/arm/boot/zImage"
                           "/media/x/compiled/clean_ver/kernel/meizu_m9_master/linux-2.6.29-meizu/arch/arm/boot/zImage"
                           "/media/x/compiled/meizu_m9_dev/arch/arm/boot/zImage" 
                          )
         COMPREPLY=($(compgen -W '${my_complete_word[@]}' -- $cur))
         ;;
     'sdnw')
         local my_complete_word=(
                           "11111/media/x/compiled/uboot-1.3.4-m9_v4/u-boot-dev.signed"
                           "11111/media/x/compiled/clean_ver/v4.0/arch/arm/boot/zImage"
                           "11111arch/arm/boot/zImage"
                           "11111/media/x/compiled/uboot-1.3.4-m9_v4/u-boot-release.signed"
                           "11111/media/x/compiled/v4.0-dev/arch/arm/boot/zImage"
                           #"/media/x/compiled/uboot-1.3.4-m9_v4/u-boot-fuse.bin"
                           #"/media/x/compiled/meizu_m9_master/linux-2.6.29-meizu/arch/arm/boot/zImage"
                           #"/media/x/compiled/clean_ver/kernel/meizu_m9_master/linux-2.6.29-meizu/arch/arm/boot/zImage"
                           #"/media/x/compiled/meizu_m9_dev/arch/arm/boot/zImage" 
                          )
         COMPREPLY=($(compgen -W '${my_complete_word[@]}' -- $cur))
         ;;
     *)
         ;;
     esac
     return 0
}

function _sdnw_complete() 
{
     local cur=${COMP_WORDS[COMP_CWORD]};
     local com=${COMP_WORDS[COMP_CWORD-1]};
     local j k
     if [[ $COMP_CWORD==1 && -z "$cur" ]];then 
       local my_complete_word=(
           "11111arch/arm/boot/zImage"
           "11111/media/x/compiled/uboot-1.3.4-m9_v4/u-boot-dev.signed"
           "11111/media/x/compiled/clean_ver/v4.0/arch/arm/boot/zImage"
           "11111/media/x/compiled/uboot-1.3.4-m9_v4/u-boot-release.signed"
           "11111/media/x/compiled/v4.0-dev/arch/arm/boot/zImage"
       )
       COMPREPLY=($(compgen -W '${my_complete_word[@]}' -- $cur))
       local dir_list=$(compgen -d)
       k="${#COMPREPLY[@]}"
       for j in $dir_list;do
         COMPREPLY[k++]=$j
       done
     else   #dir complete
       local k
       COMPREPLY=()
       local dir_list=$(compgen -d -- $cur)
       k="${#COMPREPLY[@]}"
       for j in $dir_list;do
         COMPREPLY[k++]=$j
       done
       local dir_list=$(compgen -f -- $cur)
       k="${#COMPREPLY[@]}"
       for j in $dir_list;do
         COMPREPLY[k++]=$j
       done
     fi
     return 0
}

function _fastboot_completion()
{  
	local cur  
	COMPREPLY=()  
	cur=${COMP_WORDS[COMP_CWORD]} 
	prev=${COMP_WORDS[COMP_CWORD-1]}
	if [ $COMP_CWORD -eq 1 ];then
		COMPREPLY=($( compgen -W 'flash' -- $cur ))  
	else 
		if [ $COMP_CWORD -eq 2 ];then
			COMPREPLY=($( compgen -W 'kernel bootloader ramdisk system userdata' -- $cur ))  
		else 
			if [ $COMP_CWORD -eq 3 ];then
				case "$prev" in
					"system")
						COMPREPLY=($( compgen -W 'system.img' -- $cur ))  
						;;
					"userdata")
						COMPREPLY=($( compgen -W 'userdata.img' -- $cur ))  
						;;
					"ramdisk")
						COMPREPLY=($( compgen -W 'ramdisk-uboot.img' -- $cur ))  
						;;
					"bootloader")
						COMPREPLY=($( compgen -W 'uboot_fuse.bin' -- $cur ))  
						;;
					"kernel")
						COMPREPLY=($( compgen -W 'arch/arm/boot/zImage zImage' -- $cur ))  
						;;
					*)
						COMPREPLY=($( compgen -W 'zImage' -- $cur ))  
						;;
				esac
			fi
		fi
	fi

  return 0  
}

function _mkmm_complete() 
{
     COMPREPLY=()
     local cur=${COMP_WORDS[COMP_CWORD]};
     local com=${COMP_WORDS[COMP_CWORD-1]};
     case $com in
     'mkmm')
		 if [ -d arch/arm/configs ];then
			 local my_complete_word=$(ls arch/arm/configs/m* -l |awk '{print $8}'|sed "s#.*/##")
			 COMPREPLY=($(compgen -W '${my_complete_word[@]}' -- $cur))
		 fi
         ;;  
     *)  
         ;;  
     esac
     return 0
}

function _ksvn_complete() {
	local my_complete_word=(
		'svn://172.16.11.122/svn_src' 
		'https://172.16.1.21/svn/IceCreamSandwich'
	)
	COMPREPLY=($(compgen -W '${my_complete_word[@]}' -- $cur))
	return 0
}
#complete -W 'svn://172.16.11.122/svn_src' 'https://172.16.1.21/svn/IceCreamSandwich' ksvn

complete -W 'arch/arm/configs' lac
complete -W 'xconfig' make
complete -F  _dnw_complete dnw
complete -F  _fastboot_completion fastboot 
complete -F  _mcd_complete mcd
complete -F  _mkmm_complete mkmm
complete -F  _ksvn_complete ksvn
complete -F  _sdnw_complete sdnw

function my_bash_login_auto_exec_func()
{
	[ -d ~/.trash ] || mkdir ~/.trash
	
	append_daily_path
	#unset append_daily_path

	echo $SHELL |grep -q 'bash'
	if [ $? == 0 ];then
		grep -q "mybashrc\.sh" ~/.bashrc
		if [ $? != 0 ];then
			echo "" >> ~/.bashrc
			echo "if [ -f ~/mybashrc.sh ];then" >> ~/.bashrc
			echo '	source ~/mybashrc.sh' >> ~/.bashrc
			echo "fi" >> ~/.bashrc
			echo "" >> ~/.bashrc
		fi
	fi
}

#http://blog.longwin.com.tw/2009/11/vimdiff-vs-git-diff-2009/
if [ -f ~/my_private_bashrc.sh ];then
	source ~/my_private_bashrc.sh
fi

#bash command:
#for i in $(grep "CONFIG_EVT1" * --color -rHnI|grep -v ^tags|grep -v ^cscope | awk -F: '{print $1}');do  sed -ie "s#CONFIG_EVT1#CONFIG_EXYNOS4412_EVT1#g" $i;done
#1727  git checkout --track origin/mars 

