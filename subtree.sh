#!/bin/bash

cd "$(dirname "$0")"
git subtree add -P $1 $1