#!/bin/bash

show_help() {
  echo "Dostępne opcje:"
  echo "--date | -d       : wyświetla dzisiejszą datę"
  echo "--logs | -l [n]   : tworzy pliki logx.txt (domyślnie 100)"
  echo "--help | -h       : pokazuje pomoc"
  echo "--init            : klonuje repozytorium i ustawia PATH"
  echo "--error | -e [n]  : tworzy katalogi error (domyślnie 100)"
}

REPO_URL="https://github.com/mateuszjurgielewicz/Lab4.git"
LOG_COUNT=100

init_repo() {
  git clone "$REPO_URL"
  REPO_DIR=$(basename "$REPO_URL" .git)
  export PATH="$PATH:$(pwd)/$REPO_DIR"
  echo "Repozytorium sklonowane i PATH ustawiony."
}

create_logs() {
  local count=$1
  for ((i=1; i<=count; i++)); do
    filename="log${i}.txt"
    echo -e "Nazwa pliku: $filename\nUtworzony przez: $0\nData: $(date)" > "$filename"
  done
  echo "Utworzono $count plików log."
}

create_errors() {
  local count=$1
  for ((i=1; i<=count; i++)); do
    dir="error${i}"
    mkdir -p "$dir"
    filename="${dir}/error${i}.txt"
    echo -e "Nazwa pliku: $filename\nUtworzony przez: $0\nData: $(date)" > "$filename"
  done
  echo "Utworzono $count plików error."
}

case "$1" in
  --date|-d)
    date
    ;;
  --logs|-l)
    if [[ "$2" =~ ^[0-9]+$ ]]; then
      LOG_COUNT=$2
    fi
    create_logs "$LOG_COUNT"
    ;;
  --error|-e)
    if [[ "$2" =~ ^[0-9]+$ ]]; then
      LOG_COUNT=$2
    fi
    create_errors "$LOG_COUNT"
    ;;
  --help|-h)
    show_help
    ;;
  --init)
    init_repo
    ;;
  *)
    echo "Nieznana opcja. Użyj --help lub -h."
    ;;
esac
