FROM wilsonzhou23/android-auto:latest
LABEL MAINTAINER="wilson.hui.zhou@gmail.com"

ADD kvm.sh /kvm.sh
CMD /kvm.sh

# Switch to user
USER jenkins
WORKDIR $HOME/workdir

# Setup Filter Environment
ENV ANDROID_IMAGES_X86_FILTER   sys-img-x86-android-21,sys-img-x86-android-22,sys-img-x86-android-23,sys-img-x86-android-24,sys-img-x86-android-25,sys-img-x86-android-26,sys-img-x86-android-27

# Update Android SDK packages
RUN (echo y | android update sdk --all --force --no-ui --filter ${ANDROID_IMAGES_X86_FILTER})

