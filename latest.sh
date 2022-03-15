#!/usr/bin/env bash

docker pull neerteam/epaswmm:5.2.0
docker tag neerteam/epaswmm:5.2.0 neerteam/epaswmm:latest
docker push neerteam/epaswmm:latest
