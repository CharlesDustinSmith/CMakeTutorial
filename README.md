# CMakeTutorial
Practice some more of CMake properties and ETC

## Thing you must first install 
### For Linux
```sh 
sudo apt-get update
sudo apt-get upgrade

# Mandatory 
sudo apt-get install gcc g++ gdb
sudo apt-get install make cmake
sudo apt-get install git
sudo apt-get install doxygen
sudo apt-get install python3 python3-pip

# Optional
sudo apt-get install lcov gcovr
sudo apt-get install ccache
sudo apt-get install cppcheck
sudo apt-get install llvm clang-format clang-tidy
sudo apt-get install curl zip unzip tar
```
### For Mac
```sh 
brew install git
brew install make
brew install cmake
brew install doxygen
brew install lcov
brew install gcovr
brew install ccache
```

## To build only library and not the executable use the following 
```sh
cmake --build . --target Library
```

## To add submodules to the project 
```sh
git submodule add git@github.com:nlohmann/json.git external/json
```

## To generate Doxygen file
```sh
doxygen -g
```
## Then to generate the html 
```sh
cd docs && doxygen
```

## Tools for adding exbternal Libraries
- CPM (CMake Package Manager)
- Conan
- VCPKG

# How to install the Conan Package Manager

Official installation guide is [here](https://docs.conan.io/2/).

The conan database is [here](https://conan.io/center/).

## Installation Steps

1. Install Python (3.7+)
2. Type ``pip install --user -U conan`` into the terminal
   1. Unix: Append conan to the PATH by: ``source ~/.profile``
3. Run the conan command: ``conan``
4. conan profile detect --force
5. conan profile path default

# How to install VCPKG

Official Link: <https://vcpkg.io/en/index.html>

```cmd
cd external
git clone https://github.com/Microsoft/vcpkg.git
.\vcpkg\bootstrap-vcpkg.bat # windows
./vcpkg/bootstrap-vcpkg.sh # Unix
```
## Explaining vcpkg.json 
```json
{
    // Project Name
    "name": "cpptemplateproject",
    // Project Version
    "version-string": "1.0.0",
    // Project dependencies
    "dependencies": [
        {
            "name": "cxxopts",
            // Version meaning greater than or equal to version 3.1.1 (3.1.1 is the is minimum version), Will basically install the newest version of the package
            "version>=": "3.1.1"
        },
        {
            "name": "fmt",
            "version>=": "10.1.0"
        },
        {
            "name": "nlohmann-json",
            "version>=": "3.11.2"
        },
        {
            "name": "spdlog",
            "version>=": "1.12.0"
        },
        {
            "name": "catch2",
            "version>=": "2.13.9"
        }
    ],
    // This is so that you can use a specific version of the package.
    "overrides": [
        {
            "name": "catch2",
            "version": "2.13.9"
        }
    ],
    // This is the commit number for vcpkg that you want to be used, ensure every user uses the same commit for vcpkg
    "builtin-baseline": "436a061a544c124200200517b9ee55c5bb1b7a26"
}

```
## To install the vcpkg packages using the vcpkg.json 
1. Install vcpkg
2. Add toolchain to the cmake project and find the packages
    - ```txt
        include(/home/charlessmith/vcpkg/scripts/buildsystems/vcpkg.cmake)
        find_package(nlohmann_json REQUIRED)
        find_package(fmt REQUIRED)
        find_package(spdlog REQUIRED)
        find_package(cxxopts REQUIRED)
        find_package(Catch2 REQUIRED)
    ```
3. Install from the json file 
    - ```sh
        vcpkg install 
    ```
4. Build the cmake project 
    - ```sh
        ./cmakeRunScript.sh
    ```

    # Template For C++ Projects

![C++](https://img.shields.io/badge/C%2B%2B-11%2F14%2F17%2F20%2F23-blue)
![License](https://camo.githubusercontent.com/890acbdcb87868b382af9a4b1fac507b9659d9bf/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f6c6963656e73652d4d49542d626c75652e737667)
![Linux Build](https://github.com/franneck94/CppProjectTemplate/workflows/Ubuntu%20CI%20Test/badge.svg)
[![codecov](https://codecov.io/gh/franneck94/CppProjectTemplate/branch/master/graph/badge.svg)](https://codecov.io/gh/franneck94/CppProjectTemplate)

This is a template for C++ projects. What you get:

- Library, executable and test code separated in distinct folders
- Use of modern CMake for building and compiling
- External libraries installed and managed by
  - [CPM](https://github.com/cpm-cmake/CPM.cmake) Package Manager OR
  - [Conan](https://conan.io/) Package Manager OR
  - [VCPKG](https://github.com/microsoft/vcpkg) Package Manager
- Unit testing using [Catch2](https://github.com/catchorg/Catch2) v2
- General purpose libraries: [JSON](https://github.com/nlohmann/json), [spdlog](https://github.com/gabime/spdlog), [cxxopts](https://github.com/jarro2783/cxxopts) and [fmt](https://github.com/fmtlib/fmt)
- Continuous integration testing with Github Actions and [pre-commit](https://pre-commit.com/)
- Code coverage reports, including automatic upload to [Codecov](https://codecov.io)
- Code documentation with [Doxygen](https://doxygen.nl/) and [Github Pages](https://franneck94.github.io/CppProjectTemplate/)
- Tooling: Clang-Format, Cmake-Format, Clang-tidy, Sanitizers

## Structure

``` text
├── CMakeLists.txt
├── app
│   ├── CMakesLists.txt
│   └── main.cc
├── cmake
│   └── cmake modules
├── docs
│   ├── Doxyfile
│   └── html/
├── external
│   ├── CMakesLists.txt
│   ├── ...
├── src
│   ├── CMakesLists.txt
│   ├── my_lib.h
│   └── my_lib.cc
└── tests
    ├── CMakeLists.txt
    └── main.cc
```

Library code goes into [src/](src/), main program code in [app/](app) and tests go in [tests/](tests/).

## Software Requirements

- CMake 3.21+
- GNU Makefile
- Doxygen
- Conan or VCPKG
- MSVC 2017 (or higher), G++9 (or higher), Clang++9 (or higher)
- Optional: Code Coverage (only on GNU|Clang): lcov, gcovr
- Optional: Makefile, Doxygen, Conan, VCPKG

## Building

First, clone this repo and do the preliminary work:

```shell
git clone --recursive https://github.com/franneck94/CppProjectTemplate
make prepare
```

- App Executable

```shell
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --config Release --target main
cd app
./main
```

- Unit testing

```shell
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build . --config Debug --target unit_tests
cd tests
./unit_tests
```

- Documentation

```shell
cd build
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build . --config Debug --target docs
```

- Code Coverage (Unix only)

```shell
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DENABLE_COVERAGE=ON ..
cmake --build . --config Debug --target coverage
```

For more info about CMake see [here](./README_cmake.md).

# Software Installation

## How to install VCPKG

Official Link: <https://vcpkg.io/en/index.html>

```cmd
cd external
git clone https://github.com/Microsoft/vcpkg.git
.\vcpkg\bootstrap-vcpkg.bat # windows
./vcpkg/bootstrap-vcpkg.sh # Unix
```

## How to install the Conan Package Manager

Official installation guide is [here](https://docs.conan.io/2/).

The conan database is [here](https://conan.io/center/).

### Installation Steps

1. Install Python (3.7+)
2. Type ``pip install --user -U conan`` into the terminal
   1. Unix: Append conan to the PATH by: ``source ~/.profile``
3. Run the conan command: ``conan``
4. conan profile detect --force
5. conan profile path default

## Formatter and Static Analyzer

### Tooling

Clang-Format: Formatting tool for your C/C++ code:

- Documentation for Clang-Format: [Link](https://clang.llvm.org/docs/ClangFormat.html)

Clang-Tidy: Static linting tool for your C/C++ code:

- Documentation for Clang-Tidy: [Link](https://clang.llvm.org/extra/clang-tidy/)

Cmake-Format:

```bash
pip install cmake-format # python 3.7+
```

### Install Clang Tools

It's included in the LLVM toolchain, but also installable by apt, brew, winget etc.

https://github.com/llvm/llvm-project/releases/tag/llvmorg-16.0.0


# To install the cmake targets on your machine 
```sh
sudo cmake --build . --target install 
```