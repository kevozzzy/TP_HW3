#!/bin/bash

set -e

case "$1" in
    build_generator)
        docker build -t hw-generator ./generator
        ;;
    run_generator)
        mkdir -p data
        docker run --rm \
            -v "$(pwd)/data:/data" \
            hw-generator
        ;;
    create_local_data)
        mkdir -p local_data
        python3 generator/generate.py local_data
        ;;
    *)
        echo "Неизвестная комнада"
        exit 1
        ;;
esac
