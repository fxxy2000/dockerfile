#!/bin/bash

USER jenkins
WORKDIR $HOME/workdir

# required since the kvm node isn't available when the image is built.
sudo chgrp kvm /dev/kvm

exec "$@"
