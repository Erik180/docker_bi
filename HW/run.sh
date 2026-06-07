#!/bin/bash

case "$1" in
  build_generator)
    docker build -t generator ./generator
    ;;
  run_generator)
    docker run --rm -v "$(pwd)/data:/data" generator
    ;;
  create_local_data)
    python3 generator/generate.py ./local_data
    ;;
  build_reporter)
    docker build -t reporter ./reporter
    ;;
  run_reporter)
    docker run --rm -v "$(pwd)/data:/data" reporter
    ;;
  structure)
    find . -not -path './.git/*' | sort | sed 's|[^/]*/|  |g'
    ;;
  clear_data)
    rm -f data/*.csv data/*.html
    echo "data/ очищена"
    ;;
  inside_generator)
    docker run --rm -v "$(pwd)/data:/data" generator ls /data
    ;;
  inside_reporter)
    docker run --rm -v "$(pwd)/data:/data" reporter ls /data
    ;;
  report_server)
    docker run --rm -p 8080:80 -v "$(pwd)/data:/usr/share/nginx/html" nginx
    ;;
  *)
    echo "Неизвестная команда: $1"
    ;;
esac
