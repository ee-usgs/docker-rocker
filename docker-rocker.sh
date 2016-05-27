#!/bin/bash

#
# This file would typically be placed in /usr/local
# Then, add an entry list this to your ~/.profile to include this file
# source /usr/local/docker-rocker.sh


# Opens bash in a running container, using autocomplete to help find the container based on name
dockBash() {
	echo "## Opening a bash session into $1   Use Ctrl-d to exit  ##"
	docker exec -it $1 /bin/bash
}


# Auto Complete for dockBash
_dockBash()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local ps=`docker ps --format "{{.Names}}"`
    # echo $ps
    COMPREPLY=( $(compgen -W "$ps" -- $cur) )
}

# dockBash aliases
alias doba=dockBash
alias dock-bash=dockBash
alias docker-bash=dockBash

complete -F _dockBash dockBash doba dock-bash docker-bash