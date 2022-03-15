#!/usr/bin/env bash

# 5.1.14
docker push $(VERSION=5.1.14 VARIANT=alpine ./build.sh)
docker push $(VERSION=5.1.14 VARIANT=bullseye ./build.sh)
docker push $(VERSION=5.1.14 VARIANT=buster ./build.sh)

# 5.1.15
docker push $(VERSION=5.1.15 VARIANT=alpine ./build.sh)
docker push $(VERSION=5.1.15 VARIANT=bullseye ./build.sh)
docker push $(VERSION=5.1.15 VARIANT=buster ./build.sh)

# 5.2.0
docker push $(VERSION=5.2.0 VARIANT=alpine ./build.sh)
docker push $(VERSION=5.2.0 VARIANT=bullseye ./build.sh)
docker push $(VERSION=5.2.0 VARIANT=buster ./build.sh)
