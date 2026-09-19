#!/bin/bash
set -e

echo "=== Starting Flutter Web Build for Vercel ==="

# Download and cache Flutter SDK if not present
if [ ! -d "flutter" ]; then
  echo "Cloning Flutter SDK (stable branch)..."
  git clone https://github.com/flutter/flutter.git --depth 1 -b stable flutter
fi

# Add Flutter to PATH
export PATH="$PATH:$(pwd)/flutter/bin"

# Print versions
echo "Flutter version:"
flutter --version

# Enable Web support
flutter config --enable-web

# Get dependencies
echo "Getting packages..."
flutter pub get

# Build web release
echo "Building Flutter Web release..."
flutter build web --release --base-href "/"

echo "=== Build finished successfully! Output is in build/web ==="
