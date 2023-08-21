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


