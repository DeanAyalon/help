[source](https://discord.com/channels/460871933748183040/460871933748183042/1284434374452056125)

# Problem
Getting error 'express not found'

## Cause
OP's dockerfile has the step:
```dockerfile
RUN rm -rf server/node_modules client/node_modules
```
This removes all installed dependencies...

> OP is still getting the same error