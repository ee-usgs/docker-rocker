# docker-rocker
Docker CLI utils for Linux and OS X

## Main Features

### Completions
'docker' commands will suggest auto completions.  For instance, typing:
	docker ne[tab]
will complete to:
	docker network
continuing with
	docker network cr[tab]
will complete to:
	docker network create
### Aliases
The docker command is aliased as 'dock' and completion will work as expected.
...More to come
### Shortcuts, aliases and completiongs for common commands sequences
The common command:
	docker exec -it [instance name] /bin/bash
Can be shortened to just:
	docker-bash [name with completion of running instances]
or even just one of these aliases:
	dock-bash [name]
	doba [name]
