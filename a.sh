#! /bin/bash
echo "this is a test shell,start do soemthings...."
a=10
b=20
c=30
logNum=0
log(){
	i=0
	str=""
	let logNum++
	exprStr(){
		val=$(($1+4))
		num=$((val%10-5))
		if (($num<=0))
		then
		    num=$((-num))
	    fi
		return $num
	}
	exprStr $logNum
	val=$?
	# while [ $i -lt $logNum ]
	# do
	# 	str="$str-"
	# 	let i++
	# done
	for((i=0;i<$val;i++))
	do
		str="$str--"
	done

	logNumStr=$logNum
	if [ $logNumStr -lt 10 ]
	then
		logNumStr="0$logNumStr"
	fi
    echo "$logNumStr 、log$str : $*"
}
# -eq 等于
# -ne 不等于
# -gt 大于
# -lt 小于
# -ge 大于等于
# -le 小于等于

# if [ $a -eq $b ];then
# 	log "a等于b"
# else
# 	log "a不等于b"
# fi

# if [ $a -gt $b ];then
# 	log "a大于b"
# elif [ $a -eq $b ]; then
# 	log "a等于b"
# else
# 	log "a小于b"
# fi

# if [ $a -lt $b -a $a -lt $c ]
# then
# 	log "a小于b并且小于c"
# fi

# if [ $a -le $c -o $a -ge $b ]
# then 
# 	log "a小于等于c或者a大于等于b"
# fi	

# if [ ! $a -lt $b ]
# then 
# 	log "a不小于b"
# else
# 	log "a小于b 99999"

# fi	

# if [[ $a -lt $b && $a -lt $c ]]
# then
# 	log "a小于b并且小于c"
# fi

# if [[ $a -le $c || $a -ge $b ]]
# then 
# 	log "a小于等于c或者a大于等于b"
# fi	
# log "逻辑运算测试------"

# [ 1 -eq 2 ] || log "1不等于2"
# [ ! 1 -lt 2 ] || log "1不等于2"
# [[ ! 1 -lt 2 && 2 -gt 3 ]] || log "1不等于2 并且2小于3"
# [[ 1 -lt 2 && 2 -lt 3 ]] || log "1不等于2 并且2小于3"

# 去除文件名中的空格
# eg.a - 副本 (3).txt -> a_3.txt
idx=0
for loop in `ls -a *.txt | sed 's/ /#_/g' `  
do  
	oldName="`echo $loop | sed 's/#_/ /g' `"
	newName="`echo $loop | sed 's/#_/_/g' | sed 's/-_副本//g' | sed 's/_(//g' | sed 's/)//g' `"
    mv "$oldName" "$newName" 2> /dev/null
	fileNewName[idx]=$newName
	fileOldName[idx]=$oldName
    let idx++
done 

asdf=0
for fileN in ${fileNewName[*]}
do
	log "${fileOldName[asdf]} --> $fileN"
	let asdf++
done

log "--end--"
