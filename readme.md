[source](https://forums.docker.com/t/add-nginx-to-docker-container/144055)

# Problem
Trying to add nginx to their image, image crashes the the error
```
env: can’t execute ‘bash’: No such file or directory.
```

## Proposed Solution
If possible, one should use a separate container for the proxy