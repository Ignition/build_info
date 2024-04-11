cmake_minimum_required(VERSION 3.28)
project(build_info)

set(CMAKE_CXX_STANDARD 20)

execute_process(
        COMMAND git rev-parse HEAD
        OUTPUT_VARIABLE GIT_COMMIT_HASH
        OUTPUT_STRIP_TRAILING_WHITESPACE
)
set(GIT_COMMIT_H ${CMAKE_CURRENT_BINARY_DIR}/include/git_commit.hpp)
configure_file(git_commit.hpp.in ${GIT_COMMIT_H})


add_executable(build_info)
target_sources(build_info PRIVATE main.cpp ${GIT_COMMIT_H})
target_include_directories(build_info PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/include)
