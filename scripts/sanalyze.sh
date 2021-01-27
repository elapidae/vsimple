#!/bin/bash

if [ -d "build_sanalize" ]; 
then
	rm -rf build_sanalize/*
else
	mkdir -p build_sanalize
fi

cd build_sanalize
cmake ..

src=$(find ../include/)

include_args="$(cat ./compile_commands.json | grep command | sed "s/-I/\n-I/g" | grep -v command | awk '{print $1}' | sed "s/-I/-I /g")"

checks=$(cat ../cfg/sanalyzer.cfg)

clang-tidy -config="$checks" $src -p=. --header-filter="include/*" -- $include_args -std=c++17 2>/dev/null
