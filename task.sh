#!bin/bash
ls -l -h -b -R -I "task" -I "task.sh" | awk -F" " 'NF>3{printf("%s\t%s\t%s %s %s\t%s\n", $9, $5, $6, $7, $8, $1)}' > ./task/task0
ls -R -I "task" -I "task.sh" | sed 's/.*\.//' > ./task/task1
cat ./task/task1
paste -d'\t' ./task/task0 ./task/task1 > ./task/res.xls
> ./task/task2
for file in ./*
do
	if [[ "$file" != ./task ]]
	then
		if [[ "$file" != ./task.sh ]]
		then
			if [[ "$file" = *.MOV ]]
			then
				a=$(ffprobe -i $file -show_entries format=duration -v quiet -of csv="p=0");
				echo $a >> ./task/task2
			else
				a=`echo None`;
				echo $a >> ./task/task2
			fi
		fi
	fi
done
paste -d'\t' ./task/task0 ./task/task1 ./task/task2 > ./task/res.xls
ffprobe -i *.MOV -show_entries format=duration -v quiet -of csv="p=0" >> ./task/res.xls
cat ./task/res.xls
