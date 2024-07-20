#!/bin/bash

# Execution context
cd "$(dirname "$0")/.."

pip3 list
pip3 list --format freeze > requirements.txt
# cat requirements.txt