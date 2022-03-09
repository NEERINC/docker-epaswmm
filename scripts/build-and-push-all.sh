#!/bin/bash

# 5.1.14
IMAGE=$(VERSION=5.1.14 $(dirname "$0")/build.sh)
docker push $IMAGE

# 5.1.15
IMAGE=$(VERSION=5.1.15 $(dirname "$0")/build.sh)
docker push $IMAGE

# 5.2.0
IMAGE=$(VERSION=5.2.0 $(dirname "$0")/build.sh)
docker push $IMAGE
