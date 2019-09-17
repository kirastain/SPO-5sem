#!bin/sh
ls -l -I "task" -I "task.sh" | awk -F" " 'NR>1{printf("%s\t%s\t%s %s %s\t%s\n", $9, $5, $6, $7, $8, $1)}' > ./task/task0
ls -I "task" -I "task.sh" | sed 's/.*\.//' > ./task/task1
paste -d'\t' ./task/task0 ./task/task1 > ./task/res.xls
ffprobe -i *.MOV -show_entries format=duration -v quiet -of csv="p=0" >> ./task/res.xls
cat ./task/res.xls
