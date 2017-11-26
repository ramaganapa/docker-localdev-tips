#!/bin/sh

# Source from the .rc file in repo_home. It allows to add FLAGS just by exporting environmental variable FLAGS
source ../.rc

# space seperated list of flags to be added to the docker run command.
# Flags names are same as file names in $REPO_HOME/flags
export FLAGS='rm interactive bash_history data setupuser'

# Docker run command as easy to read as possible.
# i.e. all the set up taks are declared as part of FLAGS variable.
# Aim is anyone who  looks at the commnd should understand easily what is being done rather than
# being intemidated by long flags that needs to be passed to set up environemnt to make devlopment easy
docker run --name golang -v $(pwd)/env.sh:/etc/profile.d/env.sh golang bash  -c \'$(setupuser)\'
