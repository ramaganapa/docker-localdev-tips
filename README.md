# Docker local development tips

After playing with docker both on my personal projects and at work. I was convinced I want to use it for all my personal projects and local development and for my mini training projects with my cousins.

All the good things which are must and are imposed for a good reason for productions started to byte in local developemnt. 

### What is the purpose of this repo?
This repo is neither a replacement to docker best practices nor explains how to do docker the right way. All of which concentrates on production ready docker images. This repo aims to provide help to make it easy to use docker for exploring a new tool/language more for learning and teaching.

If you came here for docker best practices. Refer to the awesome documentation on docker website https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#user

### How to use this repo?
The  easiest way to use is clone the repo and `cd` to the directory for you  programming language and start using it by executing run.sh

If you have you own scritps and images and facing issues due to virtualiztion concepts added for production purposes. You may look at the FAQ below. Maybe you will find a way to solve it.

### How to add a new language/tool directory?
Create a new folder with name identifiable to the tool. And create run.sh. To be able to use flags source .rc in repo home and set the flags(file names) in environment variable FLAGS.

For example with detailed explanation of steps look at go/bin.sh. For more complicated example where image needs to be built from a Dockerfile look at java/bin.sh

### What this project is not?
As much as possible POSIX shell compatability is expected to maintain. But, not striclty enforced. For all practical purposes it is expected that every developer is using at least BASH. I personally use zsh so I am confident it will work in zsh as well.

Recommendations are welcome in suggesting how to make sure scripts work in all of 
* bash  
* zsh
* fish

### Issue due to User virtualization 
* How to share bash_history between container runs  
  Because we run the containers using "--rm" flag and encorage immutabilty. We loose bash history sharing across the runs. File `flags/bash_history` fixes this issue by volume mounting .bash_history file on to the container everytime it is run 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
