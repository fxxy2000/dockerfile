FROM cd-artifactory.mosi-tech.com/docker_thirdpart_local/jnlp-slave:alpine
LABEL MAINTAINER="hui.zhou@mosi-tech.com"
USER root
RUN (apt-get update) && \
    (apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python python-pip python-dev build-essential curl kvm zip unzip sudo screen tmux libqt5widgets5) && \
    (pip install --upgrade pip) && \
    (pip install --upgrade virtualenv) && \
    (apt-get autoremove -y) && \
    (apt-get autoclean -y)
