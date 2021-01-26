#!/bin/bash

if [ -d "build_danalyze" ]; 
then
	rm -rf build_danalyze/*
else
    mkdir -p build_danalyze
fi

cd build_danalyze
cmake -DGUI=OFF .. &>/dev/null
make -j $(($(nproc) - 1))

echo -e '<<<<<<<<<<<<<<<<<<<<< MEMCHECK ANALYZE >>>>>>>>>>>>>>>>>>>>>>>>>>>\n'
timeout 5 valgrind --tool=memcheck --leak-check=full --leak-resolution=low --undef-value-errors=yes --xml=yes --xml-file=memcheck.xml ./cservice_template -c ../cfg/cservice_template.cfg -p /tmp/cservice_template.pid

echo
echo -e '<<<<<<<<<<<<<<<<<<<<< CACHEGRIND ANALYZE >>>>>>>>>>>>>>>>>>>>>>>>>\n'
timeout 5 valgrind --tool=cachegrind --xml=yes --xml-file=cachegrind.xml ./cservice_template -c ../cfg/cservice_template.cfg -p /tmp/cservice_template.pid

echo
echo -e '<<<<<<<<<<<<<<<<<<<<< MASSIF ANALYZE >>>>>>>>>>>>>>>>>>>>>>>>>\n'
timeout 5 valgrind --tool=massif ./cservice_template -c ../cfg/cservice_template.cfg -p /tmp/cservice_template.pid
