project(main)

cmake_minimum_required(VERSION 3.0)

set(cmake_source_dir .)
set(CMAKE_CXX_FLAGS_DEBUG "$ENV{CXXFLAGS} -O0 -Wall -g -ggdb")
set(CMAKE_CXX_FLAGS_RELEASE "$ENV{CXXFLAGS} -O3 -Wall")

# 该命令会把参数 .当前目录中所有的源文件名称赋值给srcs
aux_source_directory(. dir_srcs)

# add_executable 指示变量 srcs 中的源文件需要编译 成一个名称为 main 的可执行文件
add_executable(main ${dir_srcs})

# 指明可执行文件 main 需要连接一个名为test的链接库
# target_link_libraries(main test)
