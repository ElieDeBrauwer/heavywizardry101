    .global f1
f1: mov %rdi, %rax      # Param 1 in %rax
    add %rsi, %rax      # Param 2 in %rsi, store result in %rax
    ret
