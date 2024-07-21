[![Source](https://img.shields.io/badge/source-26A5E4?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/learn_all_code/35548)

## Requirements
- Python3 TK support (globally) 
    - MacOS: `brew install python-tk`
- [Stockfish](https://stockfishchess.org/)

## Setup
```sh
python3 -m venv .venv              # Create an isolated virtual environment for the project
source ./.venv/bin/activate        # Activate .venv
pip3 install -r requirements.txt   # Install dependencies
cp template.env ,env               # Create .env from template - then edit it with the path to your stockfish installation
```

## Development
After installing new python packages, use `./scripts/freeze.sh` to update the [requirements](./requirements.txt)
> To enable the freeze script, use `chmod u+x ./scripts/freeze.sh`

**Make sure to develop with .venv activated**

# Problem
Custom chess piece images were not loading

## Solution
Seems the width/height configurations are not handled correctly, I got the images showing, but cell sizing is funky
