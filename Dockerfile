# syntax=docker/dockerfile:1.0

FROM alpine:3.15.0 AS build
ARG VERSION

# Define the base workdir as /epaswmm
WORKDIR /epaswmm

# Install system dependencies
RUN apk add --no-cache git wget build-base cmake

# Clone EPASWMM source code for the specified version
RUN git clone -b v$VERSION --depth 1 https://github.com/USEPA/Stormwater-Management-Model.git .

# Create build folder
RUN mkdir build

# Change directory to the build folder
WORKDIR /epaswmm/build

# Run CMake to prepare a makefile
RUN cmake ..

# Make the library and binary file
RUN make

# Get a fresh image
FROM alpine:3.15.0

# Copy library and binary file from build stage
COPY --from=build /epaswmm/build/bin/*.so /usr/local/lib/.
COPY --from=build /epaswmm/build/bin/runswmm /usr/local/bin/epaswmm

# Install the libgomp package
RUN apk add --no-cache libgomp
