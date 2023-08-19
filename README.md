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