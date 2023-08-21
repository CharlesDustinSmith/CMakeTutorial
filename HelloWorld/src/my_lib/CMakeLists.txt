# Creating a variable that stores a list of all source files
set(LIBRARY_SOURCES "my_lib.cpp")
# Creating a variable that stores a list of all header files
set(LIBRARY_HEADERS "include/my_lib.h")
# Creating a target that is not an executable (A.K.A a library)
add_library(${LIBRARY_NAME} STATIC 
    ${LIBRARY_SOURCES})
# For adding the include directory which will have the header files in it
target_include_directories(${LIBRARY_NAME} PUBLIC 
    "include"
    "${CMAKE_BINARY_DIR}/configured_files/include"
)