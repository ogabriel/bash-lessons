source $(pwd)/benchmark/search/params.sh

function search() {
    local value=$1

    for ((i = 0; i < $interations; i++)); do
        if [[ "${emails[@]}" =~ "$value" ]]; then
            :
        fi
    done
}

search $p0
search $p50
search $p100
