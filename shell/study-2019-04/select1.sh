#!/bin/bash

# function: 
# author  : liangjisheng
# date    : 2019/04/15 19:51:39
# version : 1.0

# select in 通常和 case in 一起使用，在用户输入不同的编号时可以做出不同的反应

echo "What is your favorite OS?"
select name in "Linux" "Windows" "Mac OS" "UNIX" "Android"
do
    case $name in
        "Linux")
            echo "Linux是一个类UNIX操作系统，它开源免费，运行在各种服务器设备和嵌入式设备"
            break
            ;;
        "Windows")
            echo "Windows是微软开发的个人电脑操作系统，它是闭源收费的"
            break
            ;;
        "Mac OS")
            echo "Mac OS是苹果公司基于UNIX开发的一款图形界面操作系统，只能运行与苹果提供的硬件之上"
            break
            ;;
        "UNIX")
            echo "UNIX是操作系统的开山鼻祖，现在已经逐渐退出历史舞台，只应用在特殊场合"
            break
            ;;
        "Android")
            echo "Android是由Google开发的手机操作系统，目前已经占据了70%的市场份额"
            break
            ;;
        *)
            echo "输入错误，请重新输入"
    esac
done

exit 0
