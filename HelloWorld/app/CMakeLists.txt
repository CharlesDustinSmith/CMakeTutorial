# Creating variable to set the executable source
set(EXE_SOURCES
    "main.cpp")
# To compile the source file into an executable (A Target)
add_executable(${EXECUTABLE_NAME} ${EXE_SOURCES})
# Linking the libraries with the executable
target_link_libraries(${EXECUTABLE_NAME} PUBLIC 
    ${LIBRARY_NAME}
    nlohmann_json)