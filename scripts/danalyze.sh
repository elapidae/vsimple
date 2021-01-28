#!/bin/bash

scripts/tests.sh

cd tests/build_test

echo -e '<<<<<<<<<<<<<<<<<<<<< MEMCHECK ANALYZE >>>>>>>>>>>>>>>>>>>>>>>>>>>\n'
timeout 20 valgrind --tool=memcheck --leak-check=full --leak-resolution=low --undef-value-errors=yes ./test_vsimple

echo
echo -e '<<<<<<<<<<<<<<<<<<<<< CACHEGRIND ANALYZE >>>>>>>>>>>>>>>>>>>>>>>>>\n'
timeout 20 valgrind --tool=cachegrind ./test_vsimple

echo
echo -e '<<<<<<<<<<<<<<<<<<<<< MASSIF ANALYZE >>>>>>>>>>>>>>>>>>>>>>>>>\n'
timeout 20 valgrind --tool=massif ./test_vsimple
