# Windows-specific command
prepare_win:
	echo "REMOVING BUILD DIRECTORY"
	rmdir /S /Q build
	echo "DONE"
	echo "Changing directory to HelloWorld"
	cd HelloWorld
	echo "Removing build directory"
	rmdir /S /Q build
	echo "Changing directory back out of HelloWorld"
	cd ../

# Linux-specific command
prepare_lin:
	echo "REMOVING BUILD DIRECTORY"
	rm -rf build
	echo "DONE"
	echo "Changing directory to HelloWorld"
	cd HelloWorld
	echo "Removing build directory"
	rm -rf build
	echo "Changing directory back out of HelloWorld"
	cd ../

# macOS-specific command
prepare_mac:
	echo "REMOVING BUILD DIRECTORY"
	rm -rf build
	echo "DONE"
	echo "Changing directory to HelloWorld"
	cd HelloWorld
	echo "Removing build directory"
	rm -rf build
	echo "Changing directory back out of HelloWorld"
	cd ../
