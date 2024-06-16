#!/bin/bash

array=()
array+=(one two)
array+=(three)
array+=("four five")

function print_array() {
    echo "count: ${#array[@]}"

    for i in "${!array[@]}"; do
        echo "$i: ${array[$i]}"
    done
}

print_array

unset array[1]

print_array
