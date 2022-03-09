#!/bin/sh

# Check that the DOCKER_EPASWMM_VERSION variable is set
if [[ -z "${DOCKER_EPASWMM_VERSION}" ]]; then
    echo "Environment variable \"DOCKER_EPASWMM_VERSION\" is required, please export it and try again."
    exit 1
fi

MACHINE_HARDWARE_NAME=$(uname -m)
if [[ $(sysctl -n machdep.cpu.brand_string) =~ "Apple M1" ]]; then
    OS_ARCHITECTURE_SUFFIX="-arm64"
elif [[ "${MACHINE_HARDWARE_NAME}" != "amd64" ]]; then
    OS_ARCHITECTURE_SUFFIX="-${MACHINE_HARDWARE_NAME}"
else
    OS_ARCHITECTURE_SUFFIX=""
fi

# Build the image with the tag set to the DOCKER_EPASWMM_VERSION varaible
docker build . \
    --no-cache \
    --build-arg VERSION=${DOCKER_EPASWMM_VERSION} \
    -t neerteam/epaswmm:${DOCKER_EPASWMM_VERSION}${OS_ARCHITECTURE_SUFFIX}
