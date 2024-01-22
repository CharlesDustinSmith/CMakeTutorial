#include <iostream>

#include <nlohmann/json.hpp>

#include "my_lib.h"
#include "config.hpp"

int main(int argc, char *arv[])
{   
    std::cout << "Project Name: " << project_name << std::endl;
    std::cout << "Project Version: " << project_version << std::endl;

    print_hello_world();
    
    return 0;
}