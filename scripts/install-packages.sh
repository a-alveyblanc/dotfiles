#!/bin/bash

if [ "$GH_USERNAME" = "" ]; then
    GH_USERNAME="a-alveyblanc"
fi

if [ "$ENV_NAME" = "" ]; then
    ENV_NAME="dev"
fi

mamba create -n $ENV_NAME python=3.12 -y
source "$CONDA_PREFIX"/bin/activate dev

mamba install -y pyopencl pocl islpy

packages="
    pymbolic \
    cgen \
    genpy \
    pyvisfile \
    dagrt \
    leap \
    pytools \
    loopy \
    pytato \
    arraycontext \
    modepy \
    meshmode \
    grudge
"

my_packages="
    loopy \
    meshmode \
    modepy \
    grudge \
    pytools \
    pytato
"

hash -r;
for i in $packages; do
    python -m pip install --editable \
        "git+https://github.com/inducer/$i.git#egg=$i"
done

cd src
for i in $my_packages; do
    cd $i
    git remote add mygh git@github.com:$GH_USERNAME/$i
    git pull mygh
    cd ../
done

extra_packages="
    furo \
    ipython \
    jax \
    logpyle \
    matplotlib \
    meshpy \
    mpi4py \
    mypy \
    orderedsets \
    pudb \
    pylint \
    pymetis \
    pytest \
    pytest-pudb \
    pytest-xdist \
    pyyaml \
    ruff \
    sphinx \
    sphinx-copybutton
"

for i in $extra_packages; do
    python -m pip install $i
done
