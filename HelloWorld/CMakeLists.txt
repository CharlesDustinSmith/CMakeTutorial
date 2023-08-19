# 0.) Create Source and CMake file 
# 1.) mkdir build 
# 2.) cd build
# 3.) cmake ..          Generating the Build Files / Congiure the Project
#       or cmake -S . -B build      <-- Will use this version instead having to {mkdir build}
# 4.) cmake --build .
# 5.)./Executable


# The minimim required cmake version
cmake_minimum_required(VERSION 3.22)

# Defining the name of project and the version and language permitted
project(
    CppProjectTemplate 
    VERSION 1.0.0 
    LANGUAGES C CXX)

# Creating a target that is not an executable (A.K.A a library)
add_library(Library STATIC my_lib.cpp)

# To compile the source file into an executable (A Target)
add_executable(Executable main.cpp)

# Linking the libraries with the executable
target_link_libraries(Executable PUBLIC Library)


