#!/usr/bin/env bash

# Building the project
cmake -S . -B build
# Compiling the project
cmake --build ./build

# Change directory to build directory
cd build
# Running the executable
./Executable

