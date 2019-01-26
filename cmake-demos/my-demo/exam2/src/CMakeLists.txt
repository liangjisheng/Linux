aux_source_directory(. dir_test_srcs)

# ADD_LIBRARY 将 src 目录中的源文件编译为共享库
add_library(test ${dir_test_srcs})