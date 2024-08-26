[Source](https://www.reddit.com/r/docker/comments/1ewqfhn/running_docker_compose_up_and_my_container_wont/)

# Problem
Using `docker compose up`, the service stops immediately.<br>
Using `docker run --device /dev/snd --init --name container-name2 -d -t "debian:bookworm-slim"`, it container works.

## Solution
The service has no entrypoint/command defined in the Compose file.<br>
The run command `--init` flag sets the entrypoint to tini (`/dev/init`)