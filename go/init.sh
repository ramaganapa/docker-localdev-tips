groupadd -g 1000 chaitu; useradd -ms /bin/bash -u 1000 -g 1000 -p chaitu chaitu; [ -f /tmp/.bash_history ] && ln -s /tmp/.bash_history /home/chaitu; su - chaitu;
