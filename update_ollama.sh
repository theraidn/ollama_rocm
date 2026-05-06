#!/bin/bash

# Script to pull a new version of Ollama image
# This updates the ollama/ollama:rocm image to the latest version

set -e

COMPOSE_FILE="$(dirname "$0")/compose/podman-compose.yaml"
IMAGE_NAME="ollama/ollama:rocm"
CONTAINER_NAME="ollama"

echo "Updating Ollama image..."
echo "=================================================="

# Pull the latest image
echo "📥 Pulling latest $IMAGE_NAME image..."
podman pull "$IMAGE_NAME"

if [ $? -eq 0 ]; then
    echo "✅ Successfully pulled latest Ollama image"
else
    echo "❌ Failed to pull Ollama image"
    exit 1
fi

echo ""
echo "=================================================="
echo "To apply the new image, you need to restart the container:"
echo ""
echo "  1. Stop the current container:"
echo "     ./stop_ollama.sh"
echo ""
echo "  2. Start the container with the new image:"
echo "     ./start_ollama.sh"
echo ""
echo "Or to do both in one command:"
echo "  ./stop_ollama.sh && ./start_ollama.sh"
echo ""
echo "Note: Your Ollama data (models, cache) will be preserved."
