FROM docker_thirdpart_local/jnlp-slave:alpine
LABEL MAINTAINER="hui.zhou@mosi-tech.com"

USER root

# Install Dependencies
RUN (dpkg --add-architecture i386) && \
    (apt-get update) && \
    (apt-get install -y --force-yes expect git wget libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 python python-pip python-dev build-essential curl kvm zip unzip sudo screen tmux libqt5widgets5) && \

# Update PIP
    (pip install --upgrade pip) && \
    (pip install --upgrade virtualenv) && \

# Install Perforce
#RUN (wget -qO - https://package.perforce.com/perforce.pubkey | apt-key add -) && \
#    (echo "deb http://package.perforce.com/apt/ubuntu xenial release" > /etc/apt/sources.list.d/perforce.list) && \
#    (apt-get update) && \
#    (apt-get install -y helix-cli)

# Clean up
    (apt-get autoremove -y) && \
    (apt-get autoclean -y)
