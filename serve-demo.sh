#!/bin/bash

# Script to build and serve the Flutter web demo locally
# This helps test the demo before deploying to GitHub Pages

set -e

echo "🚀 Building Flutter Web Demo..."
echo ""

# Navigate to example directory
cd "$(dirname "$0")/example"

# Get dependencies
echo "📦 Installing dependencies..."
flutter pub get

# Build for web
echo "🔨 Building web app..."
flutter build web --release --base-href /

# Serve the built app
echo "🌐 Starting local server..."
echo ""
echo "✅ Demo is ready!"
echo "🔗 Open http://localhost:8000 in your browser"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

cd build/web
python3 -m http.server 8000
