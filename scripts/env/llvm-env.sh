llvm-env-capture-base-env() {
    local vars=(
        PATH \
        LD_LIBRARY_PATH \
        LIBRARY_PATH \
        CPATH \
        PKG_CONFIG_PATH \
        CMAKE_PREFIX_PATH \
        MANPATH \
        LLVM_DIR \
        MLIR_DIR
    )
    local v b
    for v in "${vars[@]}"; do
        b="_BASE_$v"
        if [[ ! -v $b ]]; then
            typeset -g "$b=${(P)v}"
        fi
    done
}

llvm-env-restore-base-env() {
    local vars=(
        PATH \
        LD_LIBRARY_PATH \
        LIBRARY_PATH \
        CPATH \
        PKG_CONFIG_PATH \
        CMAKE_PREFIX_PATH \
        MANPATH \
        LLVM_DIR \
        MLIR_DIR
    )
    local v b
    for v in "${vars[@]}"; do
        b="_BASE_$v"
        if [[ -v $b ]]; then
            typeset -g "$v=${(P)b}"
        fi
    done
}

which-llvm() {
    echo "Using LLVM at: $__MY_LLVM_PREFIX"
    command -v clang >/dev/null && clang --version | head -n1
}

llvm-use() {
    llvm-env-capture-base-env

    local prefix="${1:-$HOME/tools/llvm-project/installation/latest-nvptx-x86-clang-mlir-lld-extras}"
    export __MY_LLVM_PREFIX="$prefix"

    export PATH="$prefix/bin:$PATH"
    export LD_LIBRARY_PATH="$prefix/lib:$prefix/lib64:${LD_LIBRARY_PATH:-}"
    export LIBRARY_PATH="$prefix/lib:$prefix/lib64:${LIBRARY_PATH:-}"
    export CPATH="$prefix/include:${CPATH:-}"
    export PKG_CONFIG_PATH="$prefix/lib/pkgconfig:${PKG_CONFIG_PATH:-}"
    export CMAKE_PREFIX_PATH="$prefix:$CMAKE_PREFIX_PATH"
    export MANPATH="$PREFIX/share/man:${MANPATH:-}"

    if [[ -d "$prefix/lib/cmake/llvm" ]]; then
        export LLVM_DIR="$prefix/lib/cmake/llvm"
    fi
    if [[ -d "$prefix/lib/cmake/mlir" ]]; then
        export MLIR_DIR="$prefix/lib/cmake/mlir"
    fi

    command -v lld >/dev/null && \
        export LD=lld && \
        export LDFLAGS="-fuse-ld=lld ${LDFLAGS:-}"

    which-llvm
}

llvm-off () {
    llvm-env-restore-base-env
    echo "Turned off specific LLVM build selection"
}
