FROM wilsonzhou23/base:latest
LABEL MAINTAINER="wilson.hui.zhou@gmail.com"

# Setup Environment
ENV HOME                        /home/jenkins
ENV ANDROID_SDK_VERSION         r24.4.1
ENV ANDROID_SDK_FILENAME        android-sdk_${ANDROID_SDK_VERSION}-linux.tgz
ENV ANDROID_SDK_URL             http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ENV ANDROID_HOME                ${HOME}/tools/android-sdk-linux
ENV PATH                        ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Setup sudo
RUN (groupadd -f sudo) && \
    (usermod -a -G sudo jenkins) && \
    (echo "jenkins ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers)	
	
# Setup kvm
RUN (groupadd -f kvm) && \
    (usermod -a -G kvm jenkins)

# Switch to user
USER jenkins
WORKDIR $HOME/workdir

# Install Android SDK
RUN (mkdir -p ${HOME}/tools) && \
    (wget --output-document=${HOME}/tools/android-sdk.tgz --quiet ${ANDROID_SDK_URL}) && \
    (tar xzf ${HOME}/tools/android-sdk.tgz --directory ${HOME}/tools) && \
    (rm -f ${HOME}/tools/android-sdk.tgz) && \
    (chown -R jenkins.jenkins ${HOME}/tools/android-sdk-linux)

# Setup Filter Environment
ENV ANDROID_ESSENTIALS_FILTER   platform-tools
ENV ANDROID_BUILD_TOOLS_FILTER  build-tools-25.0.2,build-tools-25.0.3,build-tools-26.0.2,build-tools-27.0.3
ENV ANDROID_API_LEVELS_FILTER   android-15,android-16,android-17,android-18,android-19,android-21,android-22,android-23,android-24,android-25,android-26,android-27
ENV ANDROID_EXTRAS_FILTER       extra-android-support,extra-google-m2repository,extra-android-m2repository,extra-google-google_play_services

# Update Android SDK packages
RUN (echo y | android update sdk --all --force --no-ui --filter ${ANDROID_ESSENTIALS_FILTER}) && \
    (echo y | android update sdk --all --force --no-ui --filter ${ANDROID_BUILD_TOOLS_FILTER}) && \
    (echo y | android update sdk --all --force --no-ui --filter ${ANDROID_API_LEVELS_FILTER}) && \
    (echo y | android update sdk --all --force --no-ui --filter ${ANDROID_EXTRAS_FILTER})


# Update Android Tools
# This requires a special procedure since the directory is read-only during update and cannot be written.
RUN (cp -R ${ANDROID_HOME} ${ANDROID_HOME}.tmp) && \
    (echo y | ${ANDROID_HOME}.tmp/tools/android update sdk --all --force --no-ui --filter tools) && \
    (rm -rf ${ANDROID_HOME}) && \
    (mv ${ANDROID_HOME}.tmp ${ANDROID_HOME})
	
ADD entrypoint.sh /home/jenkins/entrypoint.sh
ENTRYPOINT ["/home/jenkins/entrypoint.sh"]








