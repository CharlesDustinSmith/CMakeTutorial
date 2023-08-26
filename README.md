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
