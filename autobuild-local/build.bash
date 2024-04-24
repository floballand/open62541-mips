#!/bin/bash

# This script is used to build the open62541 project for MIPS architecture

# Set the path to the open62541 project
root_path=$pwd/..


# build the project for the target device in the docker MIPS environment
docker run --rm -v "$($root_path)/.:/data" --entrypoint /bin/bash fballandreau/mips-gcc:latest \
    -c "cd /data && \
    mkdir -p build && \
    cd build && \
    cmake -DUA_ENABLE_AMALGAMATION=ON -DUA_ENABLE_COVERAGE=OFF -DUA_BUILD_EXAMPLES=OFF -DUA_BUILD_UNIT_TESTS=OFF -Os -DCMAKE_BUILD_TYPE=Release  -DUA_ENABLE_HARDENING=OFF .. && \
    make"