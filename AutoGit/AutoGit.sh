#!/bin/bash
#######################AUTOGIT####################

#FUNCION PARA LLAMAR A GIT
function autoGit
{
	if ! git checkout -b autogit; then
		git checkout autogit
	fi
	git add .
	git commit -m "AutomaticGit  $(date)"
	#NO ES NECESARIO
	#git push origin autogit
}

#BUSCAR TODOS LOS REPOS EN CARPETA
function startAutoGit
{
	#POSICIONAR PROGRAMA EN DIRECTORIO DE PROYECTOS
	#cd ~/Cursus_42
	cd ~/Projects
	pwd
	paths=$(find . -name .git)
	for elem in $paths; do
		tmp=${elem%.git}
		tmp=${tmp#./}
		#echo ~/Cursus_42/$tmp
		echo /home/lukas/Projects/$tmp
		cd /home/lukas/Projects/$tmp
		pwd
		status_lines=$(git status |wc -l)
		if [[ $status_lines -gt 2 ]]; then
			echo "Status lines " $status_lines
			autoGit
		else
			echo "Status OK"
		fi
	done
}

startAutoGit
#################DEPRECATED#######################
#echo -n "Set start dir: "
#read
#ref_dir=$REPLY

#if [[ "$1" = "build" ]]; then
#	autogit=$(docker images |grep autogit | awk '{ print $3 }')
	#if [[ $autogit ]]; then
	#	docker rmi -f $(docker images |grep autogit | awk '{ print $3 }')
	#fi
#	pwd
#	docker build . -t autogit
#elif [[ "$1" = "test" ]]; then
#	docker run -ti --rm -v ~/$ref_dir:/tmp/$ref_dir/ autogit /bin/bash
#elif [[ "$1" = "run" ]]; then
#	docker run -d --restart=always -v ~/$ref_dir:/$ref_dir/ autogit
#else
#	startAutoGit
#fi
