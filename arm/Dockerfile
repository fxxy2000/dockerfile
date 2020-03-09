FROM wilsonzhou23/android-auto:latest
LABEL MAINTAINER="wilson.hui.zhou@gmail.com"

# Switch to user
USER jenkins
WORKDIR $HOME/workdir

# Setup Filter Environment
ENV ANDROID_IMAGES_ARM_FILTER   sys-img-armeabi-v7a-android-21,sys-img-armeabi-v7a-android-27,sys-img-armeabi-v7a-android-28,sys-img-armeabi-v7a-android-29

# Update Android SDK packages
RUN (echo y | android update sdk --all --force --no-ui --filter ${ANDROID_IMAGES_ARM_FILTER})

