all: prepare_lin

install:
	@sudo apt-get install gcc g++ cmake make doxygen git llvm pkg-config curl zip unzip tar python3-dev clang-format clang-tidy

# Windows-specific command
dependency: 
	@cd build && cmake .. --graphviz=graph.dot && dot -Tpng graph.dot -o GraphImg.png

prepare_win:
	@echo "REMOVING BUILD DIRECTORY"
	@rmdir /S /Q build
	@echo "DONE"

# Linux-specific command
prepare_lin:
	@echo "REMOVING BUILD DIRECTORY"
	@rm -rf build
	@echo "DONE"

# macOS-specific command
prepare_mac:
	@echo "REMOVING BUILD DIRECTORY"
	@rm -rf build
	@echo "DONE"

conan_d:
	@rm -rf build
	@mkdir build
	@cd build && conan install .. -s build_type=Debug -s compiler.cppstd=17 --output-folder=. --build missing

conan_r:
	@rm -rf build
	@mkdir build
	@cd build && conan install .. -s build_type=Release -s compiler.cppstd=17 --output-folder=. --build missing
