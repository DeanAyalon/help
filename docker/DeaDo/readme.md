# Problem
[![Source](https://img.shields.io/badge/source-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.com/channels/460871933748183040/1264921839868710954/1264921839868710954)

OP's containers do not seem to be getting the environment variables set in [dev.env](./dev.env)<br>
Upon mocking the images and composing the stack, I could not replicate the problem, it is working fine for me - So this may have something to do with the image itself

## Solution
OPs command (`docker exec frontend printenv FRONTEND_URL`) was missing the `-it` flags

## Interesting to Note
Executing the command without `-it` within PowerShell works, but doesn't in bash

# User
![Discord - .deado](https://img.shields.io/badge/.deado-5865F2?style=for-the-badge&logo=discord&logoColor=white)