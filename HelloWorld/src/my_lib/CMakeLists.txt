# Creating a target that is not an executable (A.K.A a library)
add_library(${LIBRARY_NAME} STATIC my_lib.cpp)
# For adding the include directory which will have the header files in it
target_include_directories(${LIBRARY_NAME} PUBLIC 
    "include"
    "${CMAKE_BINARY_DIR}/configured_files/include"
)