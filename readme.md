[Source](https://discord.com/channels/460871933748183040/581537102244610058/1277531897332760610)

# Problem
nginx-proxy not recognizing docker.sock

# Solution
Container path was set to `/tmp/run/docker.sock` instead of `/tmp/docker.sock`