#!/bin/sh

image_name="java"

source ../.rc

export FLAGS='rm interactive data setupuser'

docker run --name ${image_name} ${image_name} bash -c \'$(setupuser)\'
