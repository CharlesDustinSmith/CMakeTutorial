# To compile the source file into an executable (A Target)
add_executable(${EXECUTABLE_NAME} main.cpp)
# Linking the libraries with the executable
target_link_libraries(${EXECUTABLE_NAME} PUBLIC ${LIBRARY_NAME})