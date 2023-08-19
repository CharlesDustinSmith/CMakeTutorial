# Creating a target that is not an executable (A.K.A a library)
add_library(Library STATIC my_lib.cpp)
# For adding the include directory which will have the header files in it
target_include_directories(Library PUBLIC include)