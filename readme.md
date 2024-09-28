[source](https://forums.docker.com/t/add-nginx-to-docker-container/144055)

# Problem
Trying to add nginx to their image, image crashes the the error
```
env: can’t execute ‘bash’: No such file or directory.
```

## Proposed Solution
If possible, one should use a separate container for the proxy
> Rejected - Can only use a single container

## Reason for Error
- OP misunderstood multi-stage builds, their final image was based off `nginx:alpine`, which does not have bash installed, and thus cannot run the `fusionauth` scripts
- The `CMD` step runs the fusionauth service, and only as it ends, runs nginx. Definitely not OP's intention