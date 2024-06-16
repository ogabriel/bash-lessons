#!/bin/bash

repeat=1000

array=()
array+=(one)
array+=(one)
array+=(one)
array+=(two)
array+=(two)
array+=(three)

function one() {
    declare -a unique_array=()

    for element in "${array[@]}"; do
        if [[ ! " ${unique_array[@]} " =~ " $element " ]]; then
            unique_array+=($element)
        fi
    done
}

echo "benchmarking unique by for loop and regex"

time for ((i=0; i<$repeat; i++)); do
    one
done

echo "benchmarking unique by sort unique"

function two() {
    declare -a unique_array=()

    unique_array=(`for i in ${array[@]}; do echo $i; done | sort -u`)
}

time for ((i=0; i<$repeat; i++)); do
    two
done

echo "benchmarking unique echo with sort unique"

function two_and_a_half() {
    declare -a unique_array=()

    unique_array=($(echo "${array[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
}

time for ((i=0; i<$repeat; i++)); do
    two_and_a_half
done

echo "benchmarking unique by associative array"

function three() {
    declare -A unique_array=()

    for element in "${array[@]}"; do
        unique_array[$element]=1
    done

    unique_array=(${!unique_array[@]})
}

time for ((i=0; i<$repeat; i++)); do
    three
done
