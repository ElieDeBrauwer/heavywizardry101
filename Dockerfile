FROM debian:13
RUN apt update && apt upgrade -y
RUN apt install -y \
	build-essential \
    file \
	gcc-arm-linux-gnueabi \
	gcc-aarch64-linux-gnu \
	gcc-mips-linux-gnu \
	gcc-mips64-linux-gnuabi64 \
	gcc-mips64el-linux-gnuabi64 \
	gcc-mipsel-linux-gnu \
	gcc-riscv64-linux-gnu \
	gcc-x86-64-linux-gnu \
    gdb \
    git \
	gosu \
	nasm \
    netcat-openbsd \
    qemu-user \
    strace \
	sudo \
    tmux && \
	rm -rf /var/lib/apt/lists/*

RUN git clone https://git.savannah.nongnu.org/git/netkitty.git
RUN cd netkitty && make && make install && cd .. && rm -Rf netkitty

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /opt/code

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
