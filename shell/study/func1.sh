#!/bin/bash

# name  : func1.sh
# author: liangjisheng
# time  : 2018-12-28 00:18:46

var="global var"

foo() {
    local var="local var"
    echo "Function foo is executing"
    echo "$var"
}

echo "script starting"
foo
echo "script ended"
echo "$var"

exit 0
