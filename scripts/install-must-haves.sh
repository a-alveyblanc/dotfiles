#! /bin/bash

set -e
PROGRAMS=(
    build-essential cmake ninja-build llvm-dev libclang-dev
    gdb ltrace strace valgrind
    kitty neovim tmux tmate sudo curl wireguard zsh
    npm flatpak chromium steam
    fzf silversearcher-ag ripgrep
    inkscape imagemagick ffmpeg graphviz
    ocl-icd-opencl-dev ocl-icd-libopencl1 oclgrind
    libopenmpi-dev openmpi-common mpich libmpich-dev
    libblas-dev liblapack-dev libopenblas-dev
    i3 polybar picom lutris dunst dmenu
)
