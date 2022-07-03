#!/bin/bash

#######################AUTOGIT####################
#POSICIONAR PROGRAMA EN DIRECTORIO DE PROYECTOS
cd ~/Cursus_42

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
	paths=$(find . -name .git)
	for elem in $paths; do
		tmp=${elem%.git}
		tmp=${tmp#./}
		#echo ~/Cursus_42/$tmp
		cd ~/Cursus_42/$tmp
		#pwd
		status_lines=$(git status |wc -l)
		autoGit
		if [[ $status_lines -gt 2 ]]; then
			echo "Status lines " $status_lines
			autoGit
		fi
	done

if [[ "$1" = "build" ]]; then
	docker build . -t autogit
elif [[ "$1" = "test" ]]; then
	docker run -ti --rm autogit /bin/bash
elif [[ "$1" = "run" ]]; then
	docker run -ti --restart=always autogit
else
	startAutoGit
fi
