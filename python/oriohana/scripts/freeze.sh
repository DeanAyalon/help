#!/bin/bash

# Execution context
cd "$(dirname "$0")/.."

# Activate .venv
./.venv/bin/activate

# Get requirements
pip3 list
pip3 list --format freeze > requirements.txt