#!/bin/bash

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

# Add a tag suffix based on os/arch
if /usr/bin/pgrep oahd >/dev/null 2>&1; then
    # The Apple M1 chip allows Rosetta, which is a disguised amd64 shell, however,
    # even when building the image under Rosetta, it will always be an arm64 image
    # due to CPU architecture restrictions
    ARCHITECTURE="arm64"
elif [[ $(arch) == "i386" ]]; then
    # macOS can still report `arch` as "i386", even on 64-bit machines
    # so we need to check the `uname -m` command if it is a 64-bit machine
    # if it is, then manually set it as "amd64"
    if [[ $(uname -m) == "x86_64" ]]; then
        ARCHITECTURE="amd64"
    else
        ARCHITECTURE="i386"
    fi
else
    ARCHITECTURE=$(arch)
fi

# Build the image with arguments and tag it
docker build \
    --build-arg GIT_REPO_URL=${GIT_REPO_URL} \
    --build-arg GIT_REPO_TAG=${GIT_REPO_TAG} \
    --tag neerteam/epaswmm:${VERSION}-linux-${ARCHITECTURE} .
