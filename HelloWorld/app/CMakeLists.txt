# Creating variable to set the executable source.
set(EXE_SOURCES
    "main.cpp")
# To compile the source file into an executable (A Target).
add_executable(${EXECUTABLE_NAME} ${EXE_SOURCES})
# Linking the libraries with the executable
target_link_libraries(${EXECUTABLE_NAME} PUBLIC 
    ${LIBRARY_NAME}
    nlohmann_json
)
# Enabling compiler warnings.
if(${ENABLE_WARNINGS})
    target_set_warnings(
        ${EXECUTABLE_NAME} 
        ${ENABLE_WARNINGS} 
        ${ENABLE_WARNINGS_AS_ERRORS}
    )
endif()
# Enabling Link Time Optimization (LTO).
if (ENABLE_LTO)
    target_enable_lto(
        ${EXECUTABLE_NAME}
        ${ENABLE_LTO}
    )
endif()