#!/bin/bash

if [ -d "build" ]; 
then
	rm -rf build/*
else
        mkdir -p build
fi

cd build
cmake .. &>/dev/null

src=$(find ../include/ )

include_args="$(cat ./compile_commands.json | grep command | sed "s/-I/\n-I/g" | grep -v command | awk '{print $1}' | sed "s/-I/-I /g")"

checks=$(cat ../cfg/codestyle.cfg)

clang-tidy -config="$checks" $src -p=. --header-filter="src/*" -- $include_args -std=c++17 2>/dev/null