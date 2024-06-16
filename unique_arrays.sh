#!/bin/bash

function print_array() {
    local local_array=($@)

    echo "count: ${#local_array[@]}"

    for i in "${!local_array[@]}"; do
        echo "$i: ${local_array[$i]}"
    done
}

array=()
array+=(one)
array+=(one)
array+=(one)
array+=(two)
array+=(two)
array+=(three)

print_array ${array[@]}

declare -a unique_array=()

for element in "${array[@]}"; do
    if [[ ! " ${unique_array[@]} " =~ " $element " ]]; then
        unique_array+=($element)
    fi
done

print_array ${unique_array[@]}

declare -a unique_array=()

unique_array_one=(`for i in ${array[@]}; do echo $i; done | sort -u`)

print_array ${unique_array_one[@]}

echo "benchmarking unique by associative array"

function three() {
    declare -A unique_array=()

    for element in "${array[@]}"; do
        if [[ ! ${unique_array[$element]} ]]; then
            echo $element
            unique_array[$element]=1
        fi
    done

    print_array ${!unique_array[@]}
}

three
