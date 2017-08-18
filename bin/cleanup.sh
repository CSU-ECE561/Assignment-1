#!/usr/bin/env bash


remove_paths="CMakeCache.txt CMakeFiles cmake_install.cmake Makefile cmake-build-debug"
for path in $remove_paths; do rm -rf $(find -name $path) ; done