function Length
{
	for file in ./*
	do
		echo $file
	done
	for file in ./*
	do
                	if [[ -d "${file}" ]]; then
				cd "${file}"
				Length $(ls ".")
			fi
	done
}

Length $(ls ".")

function Len
{
	ffprobe -show_entries format=duration -v quiet -of csv="p=0" -i $1
}

