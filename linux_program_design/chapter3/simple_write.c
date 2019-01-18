// write 系统调用

#include <unistd.h>
#include <stdlib.h>

int main() {
    if ((write(1, "Here is some data\n", 18)) != 18)
        // 错误变量保存在全局变量errno里
        write(2, "A wriete error has occurred on file descriptor 1\n", 46);
    exit(0);
}
