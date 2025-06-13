#!/bin/bash

LOG_COUNT=100

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
  date
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
  if [[ "$2" =~ ^[0-9]+$ ]]; then
    LOG_COUNT=$2
  fi
  for ((i=1; i<=LOG_COUNT; i++)); do
    filename="log${i}.txt"
    echo -e "Nazwa pliku: $filename\nUtworzony przez: $0\nData: $(date)" > "$filename"
  done
else
  echo "Użyj --help lub -h, aby zobaczyć dostępne opcje."
fi
