#!/bin/sh
for file in ./*
do
  if test -d $file
  then
    (
      cd $file 
      if test -d '.git'
      then 
        git log --author="Zuobin Wang\|dreamerryao\|Dreamerryao" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { if ($1>0) printf "%s : added lines: %s, removed lines: %s, total lines: %s\n", filename , add, subs, loc   }' filename=$file -
      fi
    )
  fi
done