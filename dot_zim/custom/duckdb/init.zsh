# duckdb: https://duckdb.org/

alias dk='duckdb'
alias dkui='duckdb -ui'
alias dkc='open_csv_duckdb_ui' # see function in init.zsh

# -----------------------------------------------------------------------------------

open_csv_duckdb_ui() {
  local csv_file="$1"
  local table_name=$(basename "$csv_file" .csv)
  local ui_url="http://localhost:4213"

  # Check if a file is provided
  if [[ -z "$csv_file" ]]; then
      echo "Error: Please provide a CSV file path."
      return 1
  fi

  # Check if the file exists
  if [[ ! -f "$csv_file" ]]; then
      echo "Error: File '$csv_file' not found."
      return 1
  fi

  duckdb -ui -cmd "CREATE VIEW $table_name AS SELECT * FROM read_csv_auto('$csv_file');"
}
