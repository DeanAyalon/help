[source](https://forums.docker.com/t/docker-compose-with-environment-file-gives-unexpected-results/143599)

# Problem 
Wrong .env file interpolating

## Solution
Add `--env-file tmp.env` to the `docker compose` command