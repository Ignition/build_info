#!/bin/bash

echo "Current git commit $(git rev-parse HEAD)"
cmake -S . -B build -D CMAKE_BUILD_TYPE=Release 
cmake --build build
objdump -s -j .build_info ./build/build_info
