#!/bin/sh

# check if image is already created or not
image_name="octave"
isImageCreated=$(docker images | cut -d" " -f1 | grep -c ${image_name})
if [[ ${isImageCreated} = 0 ]]; then
  docker build -t ${image_name} .
fi

source ../.rc

export FLAGS='rm interactive data setupuser x11'

docker run --name ${image_name} -v $PWD/env.sh:/etc/profile.d/env.sh ${image_name} bash -c \'$(setupuser)\'
