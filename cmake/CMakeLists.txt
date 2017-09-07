CMAKE_MINIMUM_REQUIRED (VERSION 2.6)

# Set Project
PROJECT(SystemC_FifoExample)

# Set C++ version
SET(CMAKE_CXX_STANDARD 11)

# Add CMake files to path for extension
LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../common/cmake")

# include the common cmake defs for the assignment
INCLUDE(common)

##################################################################
##
## 					Add your source files here
##
##################################################################

# Set the source Files
SET(SOURCE_FILES 
		src/simple_fifo.cpp )

##################################################################

SET(BINARY_NAME "sc_fifo")

# Create Executable
ADD_EXECUTABLE(${BINARY_NAME} ${SOURCE_FILES})
TARGET_LINK_LIBRARIES(${BINARY_NAME} systemc)

