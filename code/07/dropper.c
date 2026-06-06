#include <stdio.h>
#include <stdlib.h>

#include <sys/syscall.h>

#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>


extern char **environ;

int main(int argc, char **argv) {
    int s, n;
    unsigned long addr = 0x0100007f11110002;
    char buf[1024];

    if ((s = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) exit(1);
    if (connect(s, (struct sockaddr *) &addr, 16) < 0) exit(1);

    while (1) {
        n = read(s, buf, 1024);
        if (n <= 0) break;
        write(1, buf, n);
    }
    close(s);

    return 0;
}
