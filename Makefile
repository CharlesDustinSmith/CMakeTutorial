ifeq ($(shell uname), Linux)
    # Linux-specific command
    prepare: 
		rm -rf build 
else ifeq ($(shell uname), Darwin)
    # macOS-specific command
    prepare: 
		rm -rf build 
else ifeq ($(shell uname), Windows_NT)
    # Windows-specific command
    prepare: 
		rmdir /S /Q build 
else
    $(error Unsupported operating system: $(shell uname))
endif


