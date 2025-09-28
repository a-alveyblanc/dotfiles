export CUDA_HOME="/opt/cuda"
export CUDA_PATH="$CUDA_HOME"

path_prepend() {
    case ":$PATH" in *":$1:"*) ;; *) PATH="$1:$PATH" ;; esac
}

ld_prepend() {
    case ":${LD_LIBRARY_PATH:-}:" in *":$1:"*) ;; *) LD_LIBRARY_PATH="$1:${LD_LIBRARY_PATH:-}" ;; esac
}

path_prepend "$CUDA_HOME/bin"
ld_prepend "$CUDA_HOME/lib64"

command -v nvcc >/dev/null && nvcc --version | head -n1 || true
