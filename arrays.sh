#!/bin/bash

array=()
array+=(one two)
array+=(three)
array+=("four five")

function print_array() {
    local local_array=($@)

    echo "count: ${#local_array[@]}"

    for i in "${!local_array[@]}"; do
        echo "$i: ${local_array[$i]}"
    done
}

print_array ${array[@]}

unset array[1]

print_array ${array[@]}
