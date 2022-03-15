#!/usr/bin/env bash

# 5.1.14-alpine
docker manifest create --amend neerteam/epaswmm:5.1.14-alpine \
    neerteam/epaswmm:5.1.14-alpine-amd64-linux \
    neerteam/epaswmm:5.1.14-alpine-arm64-linux
docker manifest push neerteam/epaswmm:5.1.14-alpine

# 5.1.14-bullseye
docker manifest create --amend neerteam/epaswmm:5.1.14-bullseye \
    neerteam/epaswmm:5.1.14-bullseye-amd64-linux \
    neerteam/epaswmm:5.1.14-bullseye-arm64-linux
docker manifest push neerteam/epaswmm:5.1.14-bullseye

# 5.1.14-buster
docker manifest create --amend neerteam/epaswmm:5.1.14-buster \
    neerteam/epaswmm:5.1.14-buster-amd64-linux \
    neerteam/epaswmm:5.1.14-buster-arm64-linux
docker manifest push neerteam/epaswmm:5.1.14-buster

# 5.1.15-alpine
docker manifest create --amend neerteam/epaswmm:5.1.15-alpine \
    neerteam/epaswmm:5.1.15-alpine-amd64-linux \
    neerteam/epaswmm:5.1.15-alpine-arm64-linux
docker manifest push neerteam/epaswmm:5.1.15-alpine

# 5.1.15-bullseye
docker manifest create --amend neerteam/epaswmm:5.1.15-bullseye \
    neerteam/epaswmm:5.1.15-bullseye-amd64-linux \
    neerteam/epaswmm:5.1.15-bullseye-arm64-linux
docker manifest push neerteam/epaswmm:5.1.15-bullseye

# 5.1.15-buster
docker manifest create --amend neerteam/epaswmm:5.1.15-buster \
    neerteam/epaswmm:5.1.15-buster-amd64-linux \
    neerteam/epaswmm:5.1.15-buster-arm64-linux
docker manifest push neerteam/epaswmm:5.1.15-buster

# 5.2.0-alpine
docker manifest create --amend neerteam/epaswmm:5.2.0-alpine \
    neerteam/epaswmm:5.2.0-alpine-amd64-linux \
    neerteam/epaswmm:5.2.0-alpine-arm64-linux
docker manifest push neerteam/epaswmm:5.2.0-alpine

# 5.2.0-bullseye
docker manifest create --amend neerteam/epaswmm:5.2.0-bullseye \
    neerteam/epaswmm:5.2.0-bullseye-amd64-linux \
    neerteam/epaswmm:5.2.0-bullseye-arm64-linux
docker manifest push neerteam/epaswmm:5.2.0-bullseye

# 5.2.0-buster
docker manifest create --amend neerteam/epaswmm:5.2.0-buster \
    neerteam/epaswmm:5.2.0-buster-amd64-linux \
    neerteam/epaswmm:5.2.0-buster-arm64-linux
docker manifest push neerteam/epaswmm:5.2.0-buster
