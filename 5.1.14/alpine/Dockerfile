FROM alpine:3.15 AS build

# Define the base workdir as /epaswmm
WORKDIR /epaswmm

# Install system dependencies
RUN apk add --no-cache \
    git build-base cmake

# Clone EPASWMM source code for the specified version
RUN git clone -b v5.1.14 --depth 1 https://github.com/USEPA/Stormwater-Management-Model .

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
COPY --from=build /epaswmm/build/bin/libswmm5.so /usr/local/lib/libswmm5.so
COPY --from=build /epaswmm/build/bin/runswmm /usr/local/bin/runswmm

# Create sybmolic links for `runswmm` to commonly used binary names
RUN ln -s /usr/local/bin/runswmm /usr/local/bin/swmm && \
    ln -s /usr/local/bin/runswmm /usr/local/bin/swmm5 && \
    ln -s /usr/local/bin/runswmm /usr/local/bin/epaswmm

# Install the libgomp package
RUN apk add --no-cache libgomp
