
#1.cmake verson，指定cmake版本
cmake_minimum_required(VERSION 3.0)

# project name，指定项目的名称，一般和项目的文件夹名称对应
project(exam1)

#3.head file path，头文件目录
include_directories(
    include
)

#4.source directory，源文件目录
aux_source_directory(src dir_srcs)

# 5.set environment variable，设置环境变量，编译用到的源文件全部都要放到这里，
# 否则编译能够通过，但是执行的时候会出现各种问题，
# 比如"symbol lookup error xxxxx , undefined symbol"
set(test_math ${dir_srcs})

#6.add executable file，添加要编译的可执行文件
add_executable(${PROJECT_NAME} ${test_math})

if(CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
    message(STATUS "optional:-std=c++11")
endif(CMAKE_COMPILER_IS_GNUCXX)

# 7.add link library，添加可执行文件所需要的库，比如我们用到了
# libm.so（命名规则：lib+name+.so），就添加该库的名称
# TARGET_LINK_LIBRARIES(${PROJECT_NAME} m)
