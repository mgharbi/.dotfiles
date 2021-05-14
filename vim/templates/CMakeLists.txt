cmake_minimum_required(VERSION 3.18 FATAL_ERROR)

project(tmp
  VERSION 0.0.1
  DESCRIPTION ""
  LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS on)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

add_executable(main main.cpp)
