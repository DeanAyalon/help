[Source](https://forums.docker.com/t/no-volume-mounting-after-docker-desktop-update/147472/2)

# Problem
OP updated Docker Desktop to 4.39+ and since then cannot bind-mount
> Could not replicate

# Investigation
- Requested they perform `docker compose run --rm --entrypoint ls site /srv/jekyll` to ensure the problem is mounting