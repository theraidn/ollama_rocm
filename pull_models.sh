#!/bin/bash
# Script to pull LLM models into Ollama container
# This script runs from the host terminal and executes ollama pull inside the container

set -e

# Define models to pull
MODELS=(
    "qwen2.5-coder:14b-instruct"
    "qwen2.5-coder:0.5b"
    "qwen2.5-coder:1.5b"
    "qwen2.5-coder:7b"
    "qwen3-coder-next:q4_K_M"
    "qwen3.6"
    "codegemma:2b"
    "gpt-oss:120b"
    "gemma4:31b"
)

# Container name
CONTAINER_NAME="ollama"

# Check if container is running
if ! podman ps --filter "name=$CONTAINER_NAME" --format "{{.Names}}" | grep -q "^$CONTAINER_NAME\$"; then
    echo "Error: Container '$CONTAINER_NAME' is not running."
    echo "Please start the container first with: podman-compose up -d"
    exit 1
fi

echo "Pulling models into $CONTAINER_NAME container..."
echo "=================================================="

# Pull each model
for model in "${MODELS[@]}"; do
    echo "📥 Pulling: $model"
    podman exec $CONTAINER_NAME ollama pull "$model"
    echo "✅ Successfully pulled: $model"
    echo ""
done

echo "=================================================="
echo "✨ All models pulled successfully!"
echo ""
echo "To list available models, run:"
echo "  podman exec $CONTAINER_NAME ollama ls"
