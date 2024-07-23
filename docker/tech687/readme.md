# Problem
[![Source](https://img.shields.io/badge/source-1D63ED?style=for-the-badge&logo=docker&logoColor=white)](https://forums.docker.com/t/share-a-directory-volume-among-several-services/142634)

Upon running `docker compose run --rm myservice1 ls /dir`, no directory was found

## Solution
The user was incorrectly using 
```yml
depends_on:
  - myservice2
```

instead of 
```yml
extends:
  file: 2.yml
  service: myservice2
```

# User
[![Docker Forums - Tech687](https://img.shields.io/badge/source-1D63ED?style=for-the-badge&logo=docker&logoColor=white)](https://forums.docker.com/u/tech687)