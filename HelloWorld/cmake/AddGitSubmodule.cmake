function(add_git_submodule dir)
    # To insure that the user has git before this is ran
    find_package(Git REQUIRED)
    # If no cmake file exist in the directory, pull the library again from git
    if (NOT EXISTS ${dir}/CMakeLists.txt)
        execute_process(COMMAND ${GIT_EXECUTABLE}
            submodule update --init --recursive -- ${dir}
            WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
    endif()

    if (EXISTS ${dir}/CMakeLists.txt)
        add_subdirectory(${dir})
    endif()
endfunction(add_git_submodule)