#!/bin/sh

# Check that the DOCKER_EPASWMM_VERSION variable is set
if [[ -z "${DOCKER_EPASWMM_VERSION}" ]]; then
    echo "Environment variable \"DOCKER_EPASWMM_VERSION\" is required, please export it and try again."
    exit 1
fi

# Use an additional tag suffix if the OS architecture is not
MACHINE_HARDWARE_NAME=$(uname -m)
if [[ $(sysctl -n machdep.cpu.brand_string) =~ "Apple M1" ]]
then
    OS_ARCHITECTURE_TAG_SUFFIX="-arm64"
    echo "Detected Apple M1 chip, using tag suffix \"${OS_ARCHITECTURE_TAG_SUFFIX}\""
elif [ "${MACHINE_HARDWARE_NAME}" != "x86_64" ]
then
    OS_ARCHITECTURE_TAG_SUFFIX="-${MACHINE_HARDWARE_NAME}"
    echo "Detected a non x86_64 architecture, using tag suffix \"${OS_ARCHITECTURE_TAG_SUFFIX}\""
else
    echo "Detected x86_64 architecture, no tag suffix required"
    OS_ARCHITECTURE_TAG_SUFFIX=""
fi

# Build the image with the tag set to the DOCKER_EPASWMM_VERSION varaible
docker build \
    --no-cache \
    --build-arg VERSION=${DOCKER_EPASWMM_VERSION} \
    --progress plain \
    -t neerteam/epaswmm:${DOCKER_EPASWMM_VERSION}${OS_ARCHITECTURE_TAG_SUFFIX} .
