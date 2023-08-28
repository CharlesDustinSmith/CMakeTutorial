# Creating variable to set the executable source.
set(EXE_SOURCES
    "main.cpp")
# To compile the source file into an executable (A Target).
add_executable(${EXECUTABLE_NAME} ${EXE_SOURCES})
# Linking the libraries with the executable
target_link_libraries(${EXECUTABLE_NAME} PRIVATE 
    ${LIBRARY_NAME}
    nlohmann_json
    fmt::fmt
    spdlog::spdlog
    cxxopts::cxxopts
)
# Enabling compiler warnings.
if(${ENABLE_WARNINGS})
    target_set_warnings(
        TARGET
        ${EXECUTABLE_NAME}
        ENABLE
        ${ENABLE_WARNINGS}
        AS_ERRORS
        ${ENABLE_WARNINGS_AS_ERRORS})
endif()
# Enabling Link Time Optimization (LTO).
if(${ENABLE_LTO})
    target_enable_lto(
        TARGET
        ${EXECUTABLE_NAME}
        ENABLE
        ON)
endif()
# Enable clang tidy
if(${ENABLE_CLANG_TIDY})
    add_clang_tidy_to_target(${EXECUTABLE_NAME})
endif()