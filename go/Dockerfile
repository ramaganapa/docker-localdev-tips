FROM golang

ARG user
RUN echo $user
RUN adduser -ms /bin/bash $user sudo
USER $user
