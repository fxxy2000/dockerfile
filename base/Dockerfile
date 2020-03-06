FROM cd-artifactory.mosi-tech.com/docker_thirdpart_local/jnlp-slave:alpine
LABEL MAINTAINER="hui.zhou@mosi-tech.com"
USER root
RUN (apk update) && \
    (apk add expect wget python python-dev curl zip unzip sudo screen tmux) && \
    (apk autoremove) && \
    (apk autoclean)
