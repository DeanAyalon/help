[Source](https://discord.com/channels/460871933748183040/1273160904342769675)

# Problem
.jar files are not being copied into the container

# Solution
OP's .dockerignore was actually causing this error

> I did learn though, that the `/` at the end of a `COPY` step is important so as not to copy into a directory