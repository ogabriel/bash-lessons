#!/bin/bash

function print_array() {
    local array=("$@")
    echo "count: ${#array[@]}"

    for i in "${!array[@]}"; do
        echo "$i: ${array[$i]}"
    done
}

string="one two three"
readarray -d ' ' numbers <<<"$string"
print_array ${numbers[@]}

countries=("USA" "Canada" "Australia" "Germany" "France")
readarray -d ' ' countries <<<"${countries[*]}"
print_array ${countries[@]}

readarray -d ' ' array <<<"$string"
print_array ${array[@]}
