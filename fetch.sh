#!/bin/bash

IFS=$'\n'

if [ ! $1 ]; then
  echo No URL was passed
  exit 1
fi

url=$(echo $1)
wget --quiet ${url} -O text.html
if [ $? -ne 0 ]; then
  echo "Failed to fetch ${url}" >> errors.txt
  exit 1
fi

start=$(grep -n 'id="d5' text.html|cut -d: -f1)
start=$(expr ${start} + 3)
end=$(grep -n "</table><p align=center><b>Note</b>: Any changes in boundaries over time are not indicated in the above table.<hr>" text.html|cut -d: -f1)

loop=1

if [ -z ${end} ]; then
  echo "Failed to get start/end values"
  exit 1
fi

diocese=$(grep h1 text.html |cut -d'>' -f2|cut -d'<' -f1)
country=$(grep Country text.html|cut -d'>' -f3|cut -d'<' -f1|head -1|grep [a-z])
if [ -z ${country} ]; then
  country=$(grep Country text.html|cut -d':' -f2|head -1|sed 's/^ //g'|sed 's/\r//g')
else
  exit 1
fi

for line in $(grep -n '^' text.html)
do
  linenumber=$(echo ${line}|cut -d: -f1)
  if [ ${linenumber} -gt ${start} ]; then
    if [ ${linenumber} -lt ${end} ]; then
      year=$(echo ${line}|cut -d'>' -f3|cut -d'<' -f1)
      catholics=$(echo ${line}|cut -d'>' -f5|cut -d'<' -f1)
      totalpopulation=$(echo ${line}|cut -d'>' -f6|cut -d'<' -f1)
      percentcatholic=$(echo ${line}|cut -d'>' -f7|cut -d'<' -f1)
      dpriests=$(echo ${line}|cut -d'>' -f9|cut -d'<' -f1)
      rpriests=$(echo ${line}|cut -d'>' -f10|cut -d'<' -f1)
      tpriests=$(echo ${line}|cut -d'>' -f11|cut -d'<' -f1)
      cperpriest=$(echo ${line}|cut -d'>' -f13|cut -d'<' -f1)
      perdeacons=$(echo ${line}|cut -d'>' -f15|cut -d'<' -f1)
      male=$(echo ${line}|cut -d'>' -f16|cut -d'<' -f1)
      female=$(echo ${line}|cut -d'>' -f17|cut -d'<' -f1)
      parishes=$(echo ${line}|cut -d'>' -f18|cut -d'<' -f1)
      sourcef=$(echo ${line}|cut -d'>' -f19|cut -d'<' -f1)
      if [ ! -z ${year} ]; then
        echo \"${country}\",\"${diocese}\",\"${year}\",\"${catholics}\",\"${totalpopulation}\",\"${percentcatholic}\",\"${dpriests}\",\"${rpriests}\",\"${tpriests}\",\"${cperpriest}\",\"${perdeacons}\",\"${male}\",\"${female}\",\"${parishes}\",\"${sourcef}\"
      fi
      loop=$(expr ${loop} + 1)
    fi
  fi
done
