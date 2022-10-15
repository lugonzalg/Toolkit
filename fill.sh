files=$(ls -la test | awk '{ print $9 }')

for elem in $files; do
	echo "{\"data\":1}" > test/$elem
done
