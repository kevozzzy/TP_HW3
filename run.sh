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
    build_reporter)
        docker build -t hw-reporter ./reporter
        ;;
    run_reporter)
        mkdir -p data
        docker run --rm \
            -v "$(pwd)/data:/data" \
            hw-reporter
        ;;
    structure)
        find . \
            -not -path "./.git*" \
            -not -path "./node_modules*" \
            | sort
        ;;
    clear_data)
        mkdir -p data
        find data -maxdepth 1 -type f \
            \( -name "*.csv" -o -name "*.html" \) -delete
        ;;
    inside_generator)
        mkdir -p data
        docker run --rm \
            -v "$(pwd)/data:/data" \
            hw-generator \
            sh -c 'ls -la /data'
        ;;
    inside_reporter)
        mkdir -p data
        docker run --rm \
            -v "$(pwd)/data:/data" \
            hw-reporter \
            sh -c 'ls -la /data'
        ;;
    *)
        echo "Неизвестная комнада"
        exit 1
        ;;
esac
