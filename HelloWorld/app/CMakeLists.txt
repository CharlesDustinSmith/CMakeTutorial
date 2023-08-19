# To compile the source file into an executable (A Target)
add_executable(Executable main.cpp)
# Linking the libraries with the executable
target_link_libraries(Executable PUBLIC Library)