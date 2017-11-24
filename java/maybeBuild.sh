#!/bin/sh

image_name="java"
isImageCreated=$(docker images | cut -d" " -f1 | grep -c ${image_name})

if [[ ${isImageCreated} = 0 ]]; then
  if [ -f jdk*.rpm ]; then
    wget http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_linux-x64_bin.rpm
  fi

  docker build -t ${image_name} .
fi
