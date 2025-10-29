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

    _prepend PATH              "$prefix/bin"
    _prepend LD_LIBRARY_PATH   "$prefix/lib"
    _prepend LD_LIBRARY_PATH   "$prefix/lib64"
    _prepend LIBRARY_PATH      "$prefix/lib"
    _prepend LIBRARY_PATH      "$prefix/lib64"
    _prepend CPATH             "$prefix/include"
    _prepend PKG_CONFIG_PATH   "$prefix/lib/pkgconfig"
    _prepend CMAKE_PREFIX_PATH "$prefix"
    _prepend MANPATH           "$prefix/share/man"

    [[ -d "$prefix/lib/cmake/llvm" ]] && \
        export LLVM_DIR="$prefix/lib/cmake/llvm"
    [[ -d "$prefix/lib/cmake/mlir" ]] && \
        export MLIR_DIR="$prefix/lib/cmake/mlir"

    if command -v lld >/dev/null; then
      export LD=lld
      export LDFLAGS="-fuse-ld=lld ${LDFLAGS:-}"
    fi

    which-llvm
}

llvm-off () {
    llvm-env-restore-base-env
    echo "Turned off specific LLVM build selection"
}
