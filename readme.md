[![Source](https://img.shields.io/badge/source-26A5E4?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/learn_all_code/35548)

## Requirements
- Python3 TK support (globally) 
    - MacOS: `brew install python-tk`
- [Stockfish](https://stockfishchess.org/)

## Setup
- Create .venv `python3 -m venv .venv`
- Activate .venv `source ./.venv/bin/activate`
- Install dependencies `pip3 install -r requirements.txt`
- Configure .env using the [template](./template.env)

## Development
After installing new python packages, use `./scripts/freeze.sh` to update the [requirements](./requirements.txt)
> To enable the freeze script, use `chmod u+x ./scripts/freeze.sh`


# Problem
Custom chess piece images were not loading

## Solution
Seems the width/height configurations are not handled correctly, I got the images showing, but cell sizing is funky