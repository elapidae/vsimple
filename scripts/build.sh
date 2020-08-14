#!/bin/bash

scripts/update_submodules.sh

if [ -d "build" ]; 
then
	rm -rf build/*
else
        mkdir -p build
fi

cd build

cmake -DGUI=OFF .. 

make -j $(($(nproc) - 1))
