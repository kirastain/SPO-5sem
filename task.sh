#!bin/bash
function Length
{
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
for file in ./*
do
	if [[ -d "${file}" ]]; then
		cd "${file}"
		Length $(ls ".")
	fi
done
}
ls -l -h -R -I "task" -I "task.sh" | awk -F" " 'NF>3{i=9; while (i<NF) {printf("%s ", $i); i++;} printf("%s\t", $i)}NF>3{printf("%s\t%s %s %s\t%s\n", $5, $6, $7, $8, $1)}' > ./task/task0
ls -R -l -I "task" -I "task.sh" | awk -F" " 'NF>3{print $9}' | sed 's/.*\.//' > ./task/task1
> ./task/task2
Length $(ls ".") > ./task/task2
paste -d'\t' ./task/task0 ./task/task1 ./task/task2 > ./task/res.xls
cat ./task/res.xls
