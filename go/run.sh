#!/bin/sh

source ../.rc

export FLAGS='rm interactive bash_history data setupuser'

docker run --name golang -v $(pwd)/env.sh:/etc/profile.d/env.sh golang bash  -c \'$(setupuser)\'
