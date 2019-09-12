#!bin/sh
ls -l | awk -F" " 'NR>1{printf("%s\t%s\n", $9, $5)}' > res.xls
cat resu
