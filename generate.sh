#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

# Configurations for export files and their corresponding paths
EXPORT_CONFIGS=(
  "export-core.yaml ./content/*.yaml"
  "export-extras.yaml ./content/extras/*.yaml"
  "export-chapters.yaml ./content/chapters/*.yaml"
)

# Process each configuration
for CONFIG in "${EXPORT_CONFIGS[@]}"; do
  # Split the config into filename and path
  FILENAME=$(echo "$CONFIG" | awk '{print $1}')
  PATHS=$(echo "$CONFIG" | awk '{print $2}')
  
  # Start writing to the export file
  echo '```' > "${FILENAME}"
  
  # Iterate through all YAML files in the specified path
  for FILE in $PATHS; do
    if [[ -f "$FILE" ]]; then
      echo '---' >> "${FILENAME}"
      cat "$FILE" >> "${FILENAME}"
    fi
  done
  
  # Add a linebreak and close the markdown code block
  echo -e '\n```' >> "${FILENAME}"
done
