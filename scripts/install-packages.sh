#!/bin/sh

if [ "$GH_USERNAME" = "" ]; then
    GH_USERNAME="a-alveyblanc"
fi

mamba install pyopencl pocl islpy

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
