# Checking if computer has doxygen installed first
find_package(Doxygen)

if(DOXYGEN_FOUND)
    # Creating custom target (Just for define utility target, like running a command in the console)
    add_custom_target(
        docs 
        ${DOXYGEN_EXECUTABLE}
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/docs
    )
endif()