#!/bin/bash

if [[ $# -ne 4 ]]; then
  echo "command is $./test url_file out_file line_begin line_count"
  exit -1
fi
file=$1
file_out=$2
begin=$3
end=$(($3+$4-1))
echo "start num: $begin, end num: $end"
num=0
> $file_out
cat $file | \
while read line  
do
  num=$((num+1))
  if [[ $num -gt $end ]]; then
    exit 0
  fi
  if [[ $num -ge $begin ]]; then
    curl "$line" > $file_out 2>&1 /dev/null
    if [[ $(($num%10)) -eq 0 ]]; then
      echo $num
    fi
  fi
  if [[ $(($num%100)) -eq 0 ]]; then
    echo $num
  fi
done
exit 0