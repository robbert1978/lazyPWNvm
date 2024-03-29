#! /bin/sh

#Add i386 architecture
sudo dpkg --add-architecture i386

#Install libs and tools

sudo apt update

sudo apt-get install -y \
    socat build-essential \
    jq strace ltrace curl \
    wget rubygems gcc \
    dnsutils ncat gcc-multilib \
    net-tools gdb gdb-multiarch \
    python3 python3-pip python3-dev \
    libssl-dev libffi-dev git \
    make procps libpcre3-dev libdb-dev \
    libxt-dev libxaw7-dev libc6:i386 libncurses5:i386 libstdc++6:i386 \
    patchelf elfutils nasm vim clang
sudo apt-get install -y python-is-python3

# Install tools for pwn

cd ~/ && \
mkdir -p ~/tools && \
sudo ln -s ~/tools /tools && \
cd /tools

# Install stable pwndbg
git clone https://github.com/pwndbg/pwndbg.git && \
cd pwndbg && \
./setup.sh && \
cd ..


#Install gef
git clone https://github.com/bata24/gef

# Install alt-pwninit
git clone https://github.com/robbert1978/alt-pwninit.git && \
cd alt-pwninit && \
make setup && \
cd ../

# Install gdb-pt-dump
git clone https://github.com/martinradev/gdb-pt-dump.git

# Install vmlinux-to-elf

git clone https://github.com/marin-m/vmlinux-to-elf.git

#Setup .gdbinit

echo "source $HOME/tools/gdb-pt-dump/pt.py" >> ~/.gdbinit
sudo cp ~/.gdbinit /root/.gdbinit

# Install libc-database
git clone https://github.com/niklasb/libc-database.git

# Script for adding libc's source code to gdb
wget -O ~/tools/add_glibc_src.py https://gist.githubusercontent.com/robbert1978/84a345665c23171028d474cc699c236a/raw/1415cfed04c5f428bb65378243c81c2c3f56a690/add_glibc_src.py



# initramfs tools
wget -O ~/tools/compress.sh https://gist.github.com/robbert1978/ae191c169b81fb99038986b7636d18f1/raw/b2846f340146cb4abf789fd562a4ac968e09d0a5/compress.shm && \
chmod +x ~/tools/compress.sh

wget -O ~/tools/decompress.sh https://gist.github.com/robbert1978/ae191c169b81fb99038986b7636d18f1/raw/b2846f340146cb4abf789fd562a4ac968e09d0a5/decompress.sh && \
chmod +x ~/tools/decompress.sh


# rp++
wget -O /tmp/rp-lin-clang.zip https://github.com/0vercl0k/rp/releases/download/v2.1.2/rp-lin-clang.zip && \
unzip /tmp/rp-lin-clang.zip &&
chmod +x rp-lin

#checksec.sh

wget -O /tools/checksec.sh https://raw.githubusercontent.com/slimm609/checksec.sh/main/checksec && \
chmod +x /tools/checksec.sh

# Exit "tools" dir
cd ../

#Install one_gadget
sudo gem install one_gadget

#Install seccomp-tools
sudo apt install -y ruby-dev && \
sudo gem install seccomp-tools

#Install qemu
sudo apt install -y qemu-user qemu-user-static gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu binutils-aarch64-linux-gnu-dbg && \
sudo apt install -y gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf binutils-arm-linux-gnueabihf-dbg && \
sudo apt -y install qemu-kvm qemu
