#!/bin/bash

function Test() {
    local command=$@

    shift
    while [[ $# -gt 0 ]]; do
        local key="$1"

        case $key in
        --foo=*)
            local foo=${key#*=}
            shift
            ;;
        --bar=*)
            local bar=${key#*=}
            shift
            ;;
        *)
            echo "Unknown option: $key"
            exit 1
            ;;
        esac

    done

    echo "full command: $command"
    echo "foo: $foo"
    echo "bar: $bar"
    echo
}

Test potato --foo=bar --bar=foo
Test potato --bar=foo --foo=bar
Test potato --bar=bar
Test potato --bar=bar --bar=foo
