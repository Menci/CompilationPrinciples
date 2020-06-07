cmake_minimum_required(VERSION 3.0)
project(my-compiler CXX)

set(CMAKE_CXX_FLAGS "-Wall -std=c++17")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

flex_target(lexer scanner.ll "${CMAKE_CURRENT_BINARY_DIR}/scanner.cc")
bison_target(parser parser.yy "${CMAKE_CURRENT_BINARY_DIR}/parser.cc")

ADD_FLEX_BISON_DEPENDENCY(lexer parser)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR})

file(GLOB SRC "*.cc")
add_executable(my-compiler
    ${SRC}
    "${CMAKE_CURRENT_BINARY_DIR}/scanner.cc"
    "${CMAKE_CURRENT_BINARY_DIR}/parser.cc"
)

target_link_libraries(my-compiler fmt)
