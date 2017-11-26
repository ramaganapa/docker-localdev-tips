# Docker local development tips

After playing with docker both on my personal projects and at work. I was convinced I want to use it for all my personal projects and local development and for my mini training projects with my cousins.

All the good things which are must and are imposed for a good reason for productions started to byte in local developemnt. 

### What is the purpose of this repo?
This repo is neither a replacement to docker best practices nor explains how to do docker the right way. All of which concentrates on production ready docker images. This repo aims to provide help to make it easy to use docker for exploring a new tool/language more for learning and teaching.

If you came here for docker best practices. Refer to the awesome documentation on docker website https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#user

### How to use this repo?
The  easiest way to use is clone the repo and `CD` to the directory for you  programming language and start using it by executing run.sh

If you have you own scritps and images and facing issues due to virtualiztion concepts added for production purposes. You may look at the FAQ below. Maybe you will find a way to solve it.

### How to add a new language/tool directory?
Create a new folder with name identifiable to the tool. And create run.sh. To be able to use flags source .rc in repo home and set the flags(file names) in environment variable FLAGS.

For example with detailed explanation of steps look at go/bin.sh. For more complicated example where image needs to be built from a Dockerfile look at java/bin.sh

### What this project is not?
As much as possible POSIX shell compatabiliyt is expected to maintain. But, not striclty enforced. For all practical purposes it is expected that every developer is using at least BASH. I personally use zsh so I am confident it will work in  zsh as well.

Recommendations are welcome in suggesting how to make sure scripts work in all of 
* bash  
* zsh
* fish

### Issue due to User virtualization
* Files that are created in the docker images are not accessible to non root user on host OS.  
  when you  run docker image as `docker run <image>` docker creates a new user namespace. To give isolation in users from host OS. As a result docker has to create a new root user and execut the script  specified in entrypoint/CMD or whatever is passed in arguments. If you have read the docker best practices it mentions about creating a user with lower privileges. That may or maynot fix this isuse depending on how many users you have on host OS.
   
  Better way to fix it is everytime you run container create a user with same UID and GUID as the crrent user on host OS and switch to him
  `docker run -it <image_id> bash -c "groupadd -g $(id -g) $(id -gn); useradd -ms /bin/bash -u $(id -u) -g $(id -g) ${USER}; su - ${USER};"`
  
* How to share bash_history between container runs  
  Because we run the containers using "--rm" flag and encorage immutable containers. We loose bash history sharing across the runs. File `flags/bash_history` fixes this issue by volume mounting .bash_history file on to the container everytime it is run 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
