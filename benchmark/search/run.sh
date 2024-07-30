#!/bin/bash

echo "Using grep"
time source $(pwd)/benchmark/search/grep.sh

echo "Using regex"
time source $(pwd)/benchmark/search/search.sh

echo "Using binary search"
time source $(pwd)/benchmark/search/binary_search.sh
