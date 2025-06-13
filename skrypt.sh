#!/bin/bash

show_help() {
  echo "Dostępne opcje:"
  echo "--date | -d       : wyświetla dzisiejszą datę"
  echo "--logs | -l [n]   : tworzy pliki logx.txt (domyślnie 100)"
  echo "--help | -h       : pokazuje pomoc"
  echo "--init            : klonuje repozytorium i ustawia PATH"
  echo "--error | -e [n]  : tworzy katalogi error (domyślnie 100)"
}

LOG_COUNT=100

case "$1" in
  --date|-d)
    date
    ;;
  --logs|-l)
    if [[ "$2" =~ ^[0-9]+$ ]]; then
      LOG_COUNT=$2
    fi
    for ((i=1; i<=LOG_COUNT; i++)); do
      filename="log${i}.txt"
      echo -e "Nazwa pliku: $filename\nUtworzony przez: $0\nData: $(date)" > "$filename"
    done
    ;;
  --help|-h)
    show_help
    ;;
  *)
    echo "Nieznana opcja. Użyj --help lub -h."
    ;;
esac
