#!/bin/bash
# build.sh - Script to build and prepare XScrabble-FR

# Ensure script is executable
# chmod +x build.sh

set -e

echo "=== Building XScrabble-FR ==="

# Create directories if they don't exist
mkdir -p lib app-defaults

# Update gitignore
echo "=== Updating .gitignore ==="
make update-gitignore

# Download and prepare dictionary
echo "=== Downloading and compressing dictionary ==="
make lib/ODS8.gz

# Create release
echo "=== Creating release package ==="
make release

echo "=== Build completed successfully ==="
echo "You can find the release tarball in the release/ directory"

# Display structure
echo "=== Project structure ==="
find . -type f -not -path "./release/*" -not -path "./.git/*" | sort