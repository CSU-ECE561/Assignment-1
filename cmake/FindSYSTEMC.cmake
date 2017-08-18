# The minimum required version of SYSTEMC can be specified using the
# standard CMake syntax, e.g. FIND_PACKAGE(SYSTEMC 2.2)
#
# For these components the following variables are set:
#
#  SYSTEMC_INCLUDE_DIRS             - Full paths to all include dirs.
#  SYSTEMC_LIBRARIES                - Full paths to all libraries.
#
# Example Usages:
#  FIND_PACKAGE(SYSTEMC)
#  FIND_PACKAGE(SYSTEMC 2.3)
#

MESSAGE(STATUS "Searching for SYSTEMC")
MESSAGE(STATUS "SystemC env prefix: $ENV{SYSTEMC}")
set(SYSTEMC_PREFIX $ENV{SYSTEMC})

# The HINTS option should only be used for values computed from the system.
SET(_SYSTEMC_HINTS
        ${SYSTEMC_PREFIX}/include
        ${SYSTEMC_PREFIX}/lib
        ${SYSTEMC_PREFIX}/lib-linux
        ${SYSTEMC_PREFIX}/lib-linux64
        ${SYSTEMC_PREFIX}/lib-macos
        $ENV{SYSTEMC_PREFIX}/include
        $ENV{SYSTEMC_PREFIX}/lib
        $ENV{SYSTEMC_PREFIX}/lib-linux
        $ENV{SYSTEMC_PREFIX}/lib-linux64
        $ENV{SYSTEMC_PREFIX}/lib-macos
        ${CMAKE_INSTALL_PREFIX}/include
        ${CMAKE_INSTALL_PREFIX}/lib
        ${CMAKE_INSTALL_PREFIX}/lib-linux
        ${CMAKE_INSTALL_PREFIX}/lib-linux64
        ${CMAKE_INSTALL_PREFIX}/lib-macos
        )

# Hard-coded guesses should still go in PATHS. This ensures that the user
# environment can always override hard guesses.
SET(_SYSTEMC_PATHS
        /usr/include/SYSTEMC
        /usr/lib
        /usr/lib-linux
        /usr/lib-linux64
        /usr/lib-macos
        /usr/local/lib
        /usr/local/lib-linux
        /usr/local/lib-linux64
        /usr/local/lib-macos
        )

FIND_FILE(_SYSTEMC_VERSION_FILE
        NAMES sc_ver.h
        HINTS ${_SYSTEMC_HINTS}
        PATHS ${_SYSTEMC_PATHS}
        PATH_SUFFIXES sysc/kernel
        )

EXEC_PROGRAM("cat ${_SYSTEMC_VERSION_FILE} |grep '#define SC_VERSION_MAJOR' | awk {print\\$3} "
        OUTPUT_VARIABLE SYSTEMC_MAJOR)
EXEC_PROGRAM("cat ${_SYSTEMC_VERSION_FILE} |grep '#define SC_VERSION_MINOR' | awk {print\\$3} "
        OUTPUT_VARIABLE SYSTEMC_MINOR)
EXEC_PROGRAM("cat ${_SYSTEMC_VERSION_FILE} |grep '#define SC_VERSION_PATCH' | awk {print\\$3} "
        OUTPUT_VARIABLE SYSTEMC_PATCH)

set(SYSTEMC_VERSION ${SYSTEMC_MAJOR}.${SYSTEMC_MINOR}.${SYSTEMC_PATCH})

if("${SYSTEMC_MAJOR}" MATCHES "2")
    set(SYSTEMC_FOUND TRUE)
endif("${SYSTEMC_MAJOR}" MATCHES "2")

message(STATUS "SYSTEMC version = ${SYSTEMC_VERSION}")

FIND_PATH(SYSTEMC_INCLUDE_DIRS
        NAMES systemc.h
        HINTS ${_SYSTEMC_HINTS}
        PATHS ${_SYSTEMC_PATHS}
        )

FIND_PATH(SYSTEMC_LIBRARY_DIRS
        NAMES libsystemc.so
        HINTS ${_SYSTEMC_HINTS}
        PATHS ${_SYSTEMC_PATHS}
        )

set(SYSTEMC_LIBRARIES_DIRS ${SYSTEMC_LIBRARY_DIRS})
set(SYSTEMC_LIBRARIES ${SYSTEMC_LIBRARY_DIRS}/libsystemc.so)

message(STATUS "SYSTEMC library = ${SYSTEMC_LIBRARIES}")