#!/bin/bash

IFS=$'\n'

if [ ! $1 ]; then
  step=1
else
  step=$(echo $1)
fi

if [ ${step} -eq 1 ]; then
  wget http://www.catholic-hierarchy.org/diocese/laa.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lab.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lac.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lad.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lae.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/laf.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lag.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lah.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lai.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/laj.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lak.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lal.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lam.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lan.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lao.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lap.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/laq.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lar.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/las.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lat.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lau.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lav.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/law.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lax.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lay.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/laz.html && sleep 1


loop=1
while [ ${loop} -ne 6 ]; 
do 
  wget http://www.catholic-hierarchy.org/diocese/laa${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lab${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lac${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lad${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lae${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/laf${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lag${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lah${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lai${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/laj${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lak${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lal${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lam${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lan${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lao${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lap${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/laq${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lar${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/las${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lat${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lau${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lav${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/law${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lax${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/lay${loop}.html && sleep 1
  wget http://www.catholic-hierarchy.org/diocese/laz${loop}.html && sleep 1

  loop=$(expr ${loop} + 1)
done

fi
for file in $(ls la*html)
do
  links=$(cat ${file}|grep "<li><b>"|cut -d'"' -f2)
  for link in ${links}
  do
    url=http://www.catholic-hierarchy.org/diocese/${link}
    echo "Fetching ${link}"
    bash fetch.sh ${url} >> output.csv
  done
done
