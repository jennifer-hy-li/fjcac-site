#!/bin/bash

# Files to skip (relative paths from root)
SKIP_FILES=("index.html" "contact.html" "en/index.html" "en/contact.html" "template.html" "en_template.html" "links.html")

# Function to check if file should be skipped
should_skip() {
  for skip in "${SKIP_FILES[@]}"; do
    if [[ "$1" == "./$skip" ]]; then
      return 0  # true (should skip)
    fi
  done
  return 1  # false (should not skip)
}

# Fill Chinese HTML files (not inside /en)
for file in $(find . -type f -name "*.html" ! -path "./en/*"); do
  if should_skip "$file"; then
    echo "⏭️ Skipping $file"
  else
    echo "📝 Filling $file with Chinese template..."
    cp template.html "$file"
  fi
done

# Fill English HTML files (inside /en)
for file in $(find ./en -type f -name "*.html"); do
  if should_skip "$file"; then
    echo "⏭️ Skipping $file"
  else
    echo "📝 Filling $file with English template..."
    cp en_template.html "$file"
  fi
done

echo "✅ All remaining HTML files initialized with templates."
