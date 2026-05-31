#include <unistd.h>

const char *prompt="$ \0";

int main () {
    char input[1024];
    int  i;
  
    while (1) {
        write (1, "$ ", 2);
init_buffer:
        for(i = 0; i < sizeof(input); i++) input[i] = 0;
read_input:
        read (0, input, sizeof(input));
process:
        if (input[0] == 'q') _exit(0);
        if (input[0] == 'd') {
            write(1, "Running command d\n", 18);
        } else if (input[0] == 'w') {
            write(1, "Running command w\n", 18);
        } else {
            write(1, "Unknown Command\n",17);
        }
    }
}
