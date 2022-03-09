#!/bin/sh

# Check that the VERSION variable is set
if [[ -z "${VERSION}" ]]
then
    echo "Environment variable \"VERSION\" is required, please export it and try again."
    exit 1
fi

# Determine the git repo and tag to use based on the VERSION variable
if [[ ${VERSION} < 5.2 ]]
then
    echo "Specified EPASWMM version is less than 5.2.0, using USEPA repository"
    GIT_REPO_URL="https://github.com/USEPA/Stormwater-Management-Model.git"
    GIT_REPO_TAG="v${VERSION}"
elif [[ $VERSION == 5.2.0 ]]
then
    echo "Specified EPASWMM version is 5.2.0, using OpenWaterAnalytics repository"
    GIT_REPO_URL="https://github.com/OpenWaterAnalytics/Stormwater-Management-Model.git"
    GIT_REPO_TAG="v${VERSION}.dev7"
else
    echo "Specified EPASWMM version ${VERSION} does not exist or is not supported"
    exit 1
fi

# Use an additional tag suffix if the OS architecture is not
MACHINE_HARDWARE_NAME=$(uname -m)
if [[ $(sysctl -n machdep.cpu.brand_string) =~ "Apple M1" ]]
then
    TAG_SUFFIX="-arm64"
    echo "Detected Apple M1 chip, using tag suffix \"${TAG_SUFFIX}\""
elif [ "${MACHINE_HARDWARE_NAME}" != "x86_64" ]
then
    TAG_SUFFIX="-${MACHINE_HARDWARE_NAME}"
    echo "Detected a non x86_64 architecture, using tag suffix \"${TAG_SUFFIX}\""
else
    echo "Detected x86_64 architecture, no tag suffix required"
    TAG_SUFFIX=""
fi

# Build the image with arguments and tag it
docker build \
    --no-cache \
    --build-arg GIT_REPO_URL=${GIT_REPO_URL} \
    --build-arg GIT_REPO_TAG=${GIT_REPO_TAG} \
    --progress plain \
    -t neerteam/epaswmm:${VERSION}${TAG_SUFFIX} .
