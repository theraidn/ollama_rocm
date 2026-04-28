#!/bin/bash
# Script to pull LLM models into Ollama container
# This script runs from the host terminal and executes ollama pull inside the container

set -e

# Define models to pull
MODELS=(
    "qwen2.5-coder:14b-instruct" # agentic coding
    "qwen2.5-coder:0.5b" # coding auto-correction
    "qwen2.5-coder:1.5b" # coding auto-correction
    "qwen2.5-coder:7b" # coding auto-correction
    "qwen3-coder-next:q4_K_M" # agentic coding
    "qwen3.6"      # generic
    "codegemma:2b" # coding auto-correction
    "gpt-oss:120b" # generic
    # Test
    "gemma4:31b"   # generic
    "gemma4:e4b"   # generic
    "gemma4:26b"   # generic
    "jobautomation/OpenEuroLLM-German:latest" # optimized for german conversational interaction
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
