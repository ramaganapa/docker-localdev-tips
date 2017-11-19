#!/bin/sh

sudo docker run --rm --name golang -v $(pwd)/.bash_history:/tmp/.bash_history -v$(pwd)/data:/data -v$(pwd)/env.sh:/etc/profile.d/env.sh -it golang bash -c "groupadd -g $(id -g) $(id -gn); useradd -ms /bin/bash -u $(id -u) -g $(id -g) ${USER}; ln -s /tmp/.bash_history /home/${USER}/; su - ${USER}; "
