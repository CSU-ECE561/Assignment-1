CMAKE_MINIMUM_REQUIRED (VERSION 2.6)

# Set Project
PROJECT(AssignmentLibraries)

# Set C++ version
SET(CMAKE_CXX_STANDARD 11)

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
        src/Utils.cpp)

##################################################################

# Create library
ADD_LIBRARY(assignment SHARED ${SOURCE_FILES})

