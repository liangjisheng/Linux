cmake_minimum_required(VERSION 3.0)

add_subdirectory(mod1)
add_subdirectory(mod2)

add_executable(Main main.cpp)

target_link_libraries(Main Mod1 Mod2)
