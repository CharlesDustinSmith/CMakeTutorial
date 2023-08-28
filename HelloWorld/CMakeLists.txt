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
    LANGUAGES C CXX
)

# Setting the Cpp Standard
set(CMAKE_CXX_STANDARD 17)
# The CMAKE_CXX_STANDARD_REQUIRED variable controls whether the specified C++ standard version must be strictly adhered to.
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# The CMAKE_CXX_EXTENSIONS variable controls whether compiler-specific extensions are enabled when using a particular C++ standard
set(CMAKE_CXX_EXTENSIONS OFF)

# Using option to turn things on and off
option(COMPILE_EXECUTABLE "whether to compile the executable" ON)
# Option to enable testing
option(ENABLE_TESTING "Enable a unit testing build" ON)
# Option to enable warnings
option(ENABLE_WARNINGS "Enable warnings" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enable warnings as errors" OFF)
# Option to enable sanitizers
option(ENABLE_SANITIZE_ADDR "Enable address sanitize." OFF)
option(ENABLE_SANITIZE_UNDEF "Enable undefined sanitize." OFF)
option(ENABLE_SANITIZE_LEAK "Enable leak sanitize (Gcc/Clang only)." OFF)
option(ENABLE_SANITIZE_THREAD "Enable thread sanitize (Gcc/Clang only)." OFF)
# Option to enable LTO
option(ENABLE_LTO "Enable LTO" ON)
# Option to enable CPM (CMake Package Manager)
option(USE_CPM "Whether to use CPM or not" OFF)
# Option to enable Conan (Conan Package Manager)
option(USE_CONAN "Whether to use Conan or not" OFF)
# Option to enable Vcpkg (Microsoft Package Manager)
option(USE_VCPKG "Whether to use VCPKG or not" ON)
# Option to enable code coverage
option(ENABLE_COVERAGE "Enable a Code Coverage build." OFF)
# Option to enable clang tidy
option(ENABLE_CLANG_TIDY "Enable to add clang tidy." ON)
# Option to enable clang and cmake format 
option(ENABLE_CLANG_FORMAT "Enable to add clang-format." ON)
option(ENABLE_CMAKE_FORMAT "Enable to add cmake-format." ON)

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
# Including Safe guards for cmake 
include(ConfigSafeGuards)
# Include tools for clang-tidy and etc
include(Tools)
add_cmake_format_target()
add_clang_format_target()
# Include curstom target that enables compiler warnings
if(ENABLE_WARNINGS)
    include(Warnings)
endif()
# Adding compiler sanitizers for the project
if(ENABLE_SANITIZE_ADDR OR ENABLE_SANITIZE_UNDEF)
    include(Sanitizer)
    add_sanitizer_flags()
endif()
# Enabling code coverage
if(ENABLE_COVERAGE)
    include(CodeCoverage)
    append_coverage_compiler_flags()
endif()
# Adding compiler LTO for the project
if(ENABLE_LTO)
    include(LTO)
endif()
# Including FetchContent to get the content of a cmake file (Just another way to do the above command)
include(FetchContent)

if(USE_CPM)
    message(STATUS "Using CPM.")
    # Including the CPM for package management
    include(CPM)
    # Adding package using the cpm command. Only works for packages that are cmake project.
    cpmaddpackage("gh:nlohmann/json#v3.11.2")
    cpmaddpackage("gh:fmtlib/fmt#10.1.0")
    cpmaddpackage("gh:gabime/spdlog#v1.12.0")
    cpmaddpackage("gh:jarro2783/cxxopts#v3.1.1")
    cpmaddpackage("gh:catchorg/Catch2#v2.13.9")
elseif(USE_CONAN)
    message(STATUS "Using Conan")
    # Including the Conan for package management
    include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)
    find_package(nlohmann_json REQUIRED)
    find_package(fmt REQUIRED)
    find_package(spdlog REQUIRED)
    find_package(cxxopts REQUIRED)
    find_package(Catch2 REQUIRED)
elseif(USE_VCPKG)
    message(STATUS "Using VCPKG")
    # Including the VCPKG for package management
    include(/home/charlessmith/vcpkg/scripts/buildsystems/vcpkg.cmake)
    find_package(nlohmann_json REQUIRED)
    find_package(fmt REQUIRED)
    find_package(spdlog REQUIRED)
    find_package(cxxopts REQUIRED)
    find_package(Catch2 REQUIRED)
else()
    message(STATUS "Using FetchContent.")
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
endif()

# Adding folder to the project 
add_subdirectory(configured)
add_subdirectory(external)
add_subdirectory(src)
if(COMPILE_EXECUTABLE)
    add_subdirectory(app)
else()
    message("W/o exe. compiling.")
endif()
add_subdirectory(tests)

# Installing targets to the local machine 
install(
    TARGETS ${EXECUTABLE_NAME}
    EXPORT ${LIBRARY_NAME}
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
    RUNTIME DESTINATION bin)

install(
    TARGETS ${LIBRARY_NAME}
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)