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
# The CMAKE_CXX_STANDARD_REQUIRED variable controls whether the specified C++ standard version must be strictly adhered to.
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# The CMAKE_CXX_EXTENSIONS variable controls whether compiler-specific extensions are enabled when using a particular C++ standard
set(CMAKE_CXX_EXTENSIONS OFF)

# Using option to turn things on and off
option(COMPILE_EXECUTABLE "whether to compile the executable" OFF)
# Option to enable testing
option(ENABLE_TESTING "Enable a unit testing build" ON)
# Option to enable warnings
option(ENABLE_WARNINGS "Enable a ")
option(ENABLE_WARNINGS_AS_ERRORs "Enable a ")

# Creating variable
set(LIBRARY_NAME Library)
set(EXECUTABLE_NAME Executable)

# Setting the cmake module files that have the function in them
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
# adding the cmake module file (Adding the function) (Works for repos that are and arent cmake projects) (Probably best to use this on)
# include(AddGitSubmodule)
# Calling the function
# add_git_submodule(external/json)

# Including custom target that is in the cmake folder (Docs.cmake)
include(Docs)

# Including FetchContent to get the content of a cmake file (Just another way to do the above command)
include(FetchContent)
# Cloning the repo into our build directory (This only works for repos that are cmake projects) {First parameter -> project name, 
# Second parameter -> Git repo, Third parameter -> is the tag in the repo, Fourth parameter -> so that repo does not clone recursively}
FetchContent_Declare(
    nlohmann_json
    GIT_REPOSITORY git@github.com:nlohmann/json.git
    GIT_TAG v3.11.2
    GIT_SHALLOW TRUE
)
# Will load the library into our cmake project
FetchContent_MakeAvailable(nlohmann_json)
# Adding more exterenal libraries (string formatting library)
FetchContent_Declare(
    fmt
    GIT_REPOSITORY git@github.com:fmtlib/fmt.git
    GIT_TAG 10.1.0
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(fmt)
# Adding more exterenal libraries (logging library)
FetchContent_Declare(
    spdlog
    GIT_REPOSITORY git@github.com:gabime/spdlog.git
    GIT_TAG v1.12.0
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(spdlog)
# Adding more exterenal libraries (An argument parser library)
FetchContent_Declare(
    cxxopts
    GIT_REPOSITORY git@github.com:jarro2783/cxxopts.git
    GIT_TAG v3.1.1
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(cxxopts)
# Adding more exterenal libraries (Unit testing library)
FetchContent_Declare(
    Catch2
    GIT_REPOSITORY git@github.com:catchorg/Catch2.git
    GIT_TAG v2.13.9
    GIT_SHALLOW TRUE
)
FetchContent_MakeAvailable(Catch2)

# Adding folder to the project 
add_subdirectory(configured)
add_subdirectory(external)
add_subdirectory(src)
if(COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("W/o exe. compiling")
endif()
add_subdirectory(tests)
