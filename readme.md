[Source](https://forums.docker.com/t/no-volume-mounting-after-docker-desktop-update/147472/2)

# Problem
OP updated Docker Desktop to 4.39+ and since then cannot bind-mount
> Could not replicate

# Investigation
- `docker compose run --rm site ls /srv/jekyll` - proved the problem is indeed with mounting

We have similar set ups, with the key difference being my Sequoia 15.7 as opposed to OP's Sonoma 14.7
My bind-mounts work with all versions, his stop working on 4.39-4.40, so for the meantime, they downgraded back to 4.38
