[source](https://discord.com/channels/460871933748183040/460871933748183042/1289372778432299058)

# Goal
Copy all files with an extension

## Proposed Solution
Copy all files with `.` in their name, to match for extension. 
> Will also copy directories like `.git`, so they should be in `.dockerignore`

```dockerfile
COPY *.* .
```

> Not good enough

Therefore, [OP asked](https://discord.com/channels/460871933748183040/460871933748183042/1289730502017679436) if a script can decide what to `COPY` from the build context<br>
**I suggested a multi-stage build, which only carries over the desired files**