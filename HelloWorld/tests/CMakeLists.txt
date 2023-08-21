if(ENABLE_TESTING)
    # Name for the executable
    set(TEST_MAIN 
        "unit_tests"
    )
    # 
    set(TEST_SOURCES 
        "main.cpp"    
    )
    set(TEST_INCLUDES
        "./"
    )
    
    # Adding the executable and linking the libraries
    add_executable(${TEST_MAIN} ${TEST_SOURCES})
    target_include_directories(${TEST_MAIN} PUBLIC ${TEST_INCLUDES})
    # Linking libraries
    target_link_libraries(${TEST_MAIN} PUBLIC
        ${LIBRARY_NAME}
        Catch2::Catch2 
    )
endif()
