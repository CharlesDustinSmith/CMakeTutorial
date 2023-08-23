# Creating a variable that stores a list of all source files
set(LIBRARY_SOURCES 
    "my_lib.cpp"
)
# Creating a variable that stores a list of all header files
set(LIBRARY_HEADERS 
    "include/my_lib.h"
)
# Creating a variable that stores all library includes
set(LIBRARY_INCLUDES 
    "./include/"
    "${CMAKE_BINARY_DIR}/configured_files/include"
)
# Creating a target that is not an executable (A.K.A a library)
add_library(${LIBRARY_NAME} STATIC 
    ${LIBRARY_SOURCES}
)
# For adding the include directory which will have the header files in it
target_include_directories(${LIBRARY_NAME} PUBLIC 
    ${LIBRARY_INCLUDES}
)
# To use the librarys that I fetched using the FetchContent_Declare and FetchContent_MakeAvailable on the main level CMakeLists.txt
target_link_libraries(${LIBRARY_NAME} PUBLIC 
    nlohmann_json::nlohmann_json
    fmt::fmt
    spdlog::spdlog
    cxxopts::cxxopts
)
# Calling function to run compiler warnings
if(${ENABLE_WARNINGS})
    target_set_warnings(
        ${LIBRARY_NAME} 
        ${ENABLE_WARNINGS} 
        ${ENABLE_WARNINGS_AS_ERRORS}
    )
endif()
# Add some optimization for the compiler
if (ENABLE_LTO)
    target_enable_lto(
        ${LIBRARY_NAME}
        ${ENABLE_LTO}
    )
endif()