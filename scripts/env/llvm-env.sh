PREFIX="$HOME/tools/llvm-project/installation/latest-nvptx-x86-clang-mlir-lld-extras"

export PATH="$BUILD_PREFIX/bin:$PATH"
export LD_LIBRARY_PATH="$BUILD_PREFIX/lib:$PREFIX/lib64:${LD_LIBRARY_PATH:-}"
export LIBRARY_PATH="$BUILD_PREFIX/lib:$PREFIX/lib64:${LIBRARY_PATH:-}"
export CPATH="$PREFIX/include:${CPATH:-}"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:${PKG_CONFIG_PATH:-}"
export CMAKE_PREFIX_PATH="$PREFIX:$CMAKE_PREFIX_PATH"
export MANPATH="$PREFIX/share/man:${MANPATH:-}"

export LLVM_DIR="$PREFIX_PATH/lib/cmake/llvm"
export MLIR_DIR="$PREFIX_PATH/lib/cmake/mlir"

export LD=lld
export LDFLAGS="-fuse-ld=lld ${LDFLAGS:-}"

[ -f "$HOME/dotfiles/scripts/env/cuda.sh" ] && . "$HOME/dotfiles/scripts/env/cuda.sh"
