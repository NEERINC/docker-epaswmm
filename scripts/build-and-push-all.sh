#!/bin/bash

if /usr/bin/pgrep oahd >/dev/null 2>&1
then
    TAG_SUFFIX="-arm64-linux"
else
    TAG_SUFFIX="-$(arch)-linux"
fi

# 5.1.14
VERSION=5.1.14 $(dirname "$0")/build.sh
docker push neerteam/epaswmm:5.1.14${TAG_SUFFIX}

# 5.1.15
VERSION=5.1.15 $(dirname "$0")/build.sh
docker push neerteam/epaswmm:5.1.15${TAG_SUFFIX}

# 5.2.0
VERSION=5.2.0 $(dirname "$0")/build.sh
docker push neerteam/epaswmm:5.2.0${TAG_SUFFIX}
