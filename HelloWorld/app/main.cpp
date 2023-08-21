#include <iostream>

#include <nlohmann/json.hpp>

#include "my_lib.h"
#include "config.hpp"

int main(int argc, char *arv[])
{   
    std::cout << "Project Name: " << project_name << std::endl;
    std::cout << "Project Version: " << project_version << std::endl;

    std::cout << "JSON Lib Version: " << 
        NLOHMANN_JSON_VERSION_MAJOR << "." <<
        NLOHMANN_JSON_VERSION_MINOR << "." <<
        NLOHMANN_JSON_VERSION_PATCH << std::endl;
    
    print_hello_world();
    
    return 0;
}