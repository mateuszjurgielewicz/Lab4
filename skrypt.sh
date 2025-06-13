#!/bin/bash

if [[ "$1" == "--date" || "$1" == "-d" ]]; then
  date
else
  echo "Użyj --help lub -h, aby zobaczyć dostępne opcje."
fi
