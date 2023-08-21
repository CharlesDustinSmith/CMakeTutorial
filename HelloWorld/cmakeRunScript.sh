#!/usr/bin/env bash

# Building the project option on for compile executable variable and generate for unix 
cmake -S . \
-B build \
-DCOMPILE_EXECUTABLE=ON \
-DCMAKE_BUILD_TYPE=Debug \
-G "Unix Makefiles"

# Compiling the project
cmake --build ./build

# Change directory to build directory
cd build/app
# Running the executable
./Executable

