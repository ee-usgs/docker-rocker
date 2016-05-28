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

_docker() {
	local cur=${COMP_WORDS[COMP_CWORD]}
	local prev=${COMP_WORDS[COMP_CWORD-1]}

	case "$prev" in
	network)
    	COMPREPLY=( $( compgen -W "connect create disconnect inspect ls rm" -- $cur ) )
    	return 0
    	;;
	volume)
    	COMPREPLY=( $( compgen -W "create inspect ls rm" -- $cur ) )
    	return 0
    	;;
    *)
		local cmds="daemon attach build commit cp create diff events exec export history images import info inspect kill load login logout logs network pause port ps pull push rename restart rm rmi run save search start stats stop tag top unpause update version volume wait"
		COMPREPLY=( $(compgen -W "$cmds" -- $cur) )
		;;
	esac
}

# docker aliases
alias dock=docker

complete -F _docker docker dock
