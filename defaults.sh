#!/usr/bin/env bash

docker pull neerteam/epaswmm:5.1.14-bullseye-amd64-linux
docker tag neerteam/epaswmm:5.1.14-bullseye-amd64-linux neerteam/epaswmm:5.1.14
docker push neerteam/epaswmm:5.1.14

docker pull neerteam/epaswmm:5.1.15-bullseye-amd64-linux
docker tag neerteam/epaswmm:5.1.15-bullseye-amd64-linux neerteam/epaswmm:5.1.15
docker push neerteam/epaswmm:5.1.15

docker pull neerteam/epaswmm:5.2.0-bullseye-amd64-linux
docker tag neerteam/epaswmm:5.2.0-bullseye-amd64-linux neerteam/epaswmm:5.2.0
docker push neerteam/epaswmm:5.2.0
