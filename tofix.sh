#!/bin/bash

if [ ! $1 ]; then
  echo "You must provide a file"
  exit 1
fi

file=$(echo $1)

cat ${file} | \
sed 's/&#7891;/ồ/g' | \
sed 's/&#432;/ư/g' | \
sed 's/&#7901;/ờ/g' | \
sed 's/&#7879;/ệ/g' | \
sed 's/&#7929;/ỹ/g' | \
sed 's/&#7883;/ị/g' | \
sed 's/&#7847;/ầ/g' | \
sed 's/&#7841;/ạ/g' | \
sed 's/&#7871;/ế/g' | \
sed 's/&#7843;/ả/g' | \
sed 's/&#7841;/ạ/g' | \
sed 's/&#7929;/ỹ/g' | \
sed 's/&#7861;/ẵ/g' | \
sed 's/&#417;/ơ/g' | \
sed 's/&#7857;/ằ/g' 
