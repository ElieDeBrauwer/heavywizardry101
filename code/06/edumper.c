#include <stdio.h>
#include <unistd.h>

#define BUF_SIZE 256

int main(int argc, char *argv[]) {
    unsigned char buf[BUF_SIZE];
    int l, i;

    int first = 1;
    while (1) {
        if ((l = read(0, buf, BUF_SIZE)) <= 0) break;
        printf("echo -n -e \"");
        for (i = 0; i < l; i++)
            printf("\\\\x%02x", buf[i]);
        if (first) {
            printf("\" > k\n");
            first = 0;
        } else {
            printf("\" >> k\n");
        }
    }
}
