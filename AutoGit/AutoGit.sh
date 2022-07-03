#!/bin/bash

#######################AUTOGIT####################

#FUNCION PARA LLAMAR A GIT
function autoGit
{
	git checkout -b autogit 
	git add .
	git commit -m "AutomaticGit  $(date)"
	git push origin autogit
}

#BUSCAR TODOS LOS REPOS EN CARPETA
function startAutoGit
{
	#POSICIONAR PROGRAMA EN DIRECTORIO DE PROYECTOS
	#cd ~/Cursus_42
	cd /tmp
	paths=$(find . -name .git)
	for elem in $paths; do
		tmp=${elem%.git}
		tmp=${tmp#./}
		#echo ~/Cursus_42/$tmp
		cd /tmp/$tmp
		#pwd
		status_lines=$(git status |wc -l)
		autoGit
		if [[ $status_lines -gt 2 ]]; then
			echo "Status lines " $status_lines
			autoGit
		fi
	done
}

if [[ "$1" = "build" ]]; then
	autogit=$(docker images |grep autogit | awk '{ print $3 }')
	if [[ $autogit ]]; then
		docker rmi -f $(docker images |grep autogit | awk '{ print $3 }')
	fi
	pwd
	docker build . -t autogit
elif [[ "$1" = "test" ]]; then
	docker run -ti --rm -v ~/Cursus_42:/tmp/Cursus_42/ autogit /bin/bash
elif [[ "$1" = "run" ]]; then
	docker run -d --restart=always -v ~/Cursus_42:/Cursus_42/ autogit
else
	startAutoGit
fi
