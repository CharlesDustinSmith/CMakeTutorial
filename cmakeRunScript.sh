#!/usr/bin/env bash

# Building the project option on for compile executable variable and generate for unix 
cmake -S . \
-B build \
-DCOMPILE_EXECUTABLE=ON \
-DCMAKE_BUILD_TYPE=Debug \
-DENABLE_TESTING=ON \
-DENABLE_WARNINGS=ON \
-DENABLE_WARNINGS_AS_ERRORS=OFF \
-DENABLE_SANITIZE_ADDR=OFF \
-DENABLE_SANITIZE_UNDEF=OFF \
-DUSE_CPM=OFF \
-DUSE_CONAN=OFF \
-DUSE_VCPKG=ON \
-G "Unix Makefiles"

# Compiling the project
cmake --build ./build

# Change directory to build directory
cd build/app
# Running the executable
./Executable

