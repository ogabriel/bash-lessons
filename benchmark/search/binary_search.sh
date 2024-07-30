source $(pwd)/benchmark/search/params.sh

function search() {
    local value=$1

    for ((i = 0; i < $interations; i++)); do
        start_index=0
        end_index=$((${#emails[@]} - 1))

        while [[ $start_index -le $end_index ]]; do
            middle_index=$((((start_index + end_index) / 2)))
            middle_value=${emails[$middle_index]}

            if [[ $middle_value > $value ]]; then
                end_index=$((end_index - middle_index - 1))
            elif [[ $middle_value < $value ]]; then
                start_index=$((middle_index + 1))
            else
                break
            fi
        done
    done
}

search $p0
search $p50
search $p100
