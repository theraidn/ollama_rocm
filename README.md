Ollama ROCm via Podman Compose
==============================

Run Ollama with AMD GPU acceleration on Fedora Atomic. Requires Podman, podman-compose, and ROCm drivers.

Quick Start
-----------

| Step | Action                                |
|------|---------------------------------------|
| 1    | Edit `compose/.env` to set `OLLAMA_DATA_PATH` |
| 2    | Run `chmod +x *.sh`                   |
| 3    | Start: `./start_ollama.sh`            |
| 4    | Pull models: `./pull_models.sh`       |
| 5    | Run a model: `podman exec ollama ollama run llama3` |
| 6    | Stop: `./stop_ollama.sh`              |
