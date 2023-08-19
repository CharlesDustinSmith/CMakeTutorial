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

# Setting the Cpp Standard
set(CMAKE_CXX_STANDARD 17)
# 
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# 
set(CMAKE_CXX_EXTENSIONS OFF)

# Using option to turn things on and off
option(COMPILE_EXECUTABLE "whether to compile the executable")

# Creating variable
set(LIBRARY_NAME Library)
set(EXECUTABLE_NAME Executable)

# Adding folder to the project
add_subdirectory(src)
if(COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("W/o exe. compiling")
endif()


